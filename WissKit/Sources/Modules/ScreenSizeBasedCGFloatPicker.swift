//
// Created by Alan on 2020/02/08.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation
import UIKit


public class ScreenSizeBasedCGFloatPicker {

    public fileprivate(set) var constraints: [ScreenSizeBasedCGFloatConstraints] = []
    public let defaultValue: CGFloat


    init(defaultValue: CGFloat) {
        self.defaultValue = defaultValue
    }


    public func width(_ relation: @escaping (CGFloat, CGFloat) -> Bool, _ criteria: CGFloat) -> ScreenSizeBasedCGFloatConstraints {
        ScreenSizeBasedCGFloatConstraints(for: self) { relation($0.width, criteria) }
    }


    public func height(_ relation: @escaping (CGFloat, CGFloat) -> Bool, _ criteria: CGFloat) -> ScreenSizeBasedCGFloatConstraints {
        ScreenSizeBasedCGFloatConstraints(for: self) { relation($0.height, criteria) }
    }


    static func pick(with defaultValue: CGFloat, _ build: (ScreenSizeBasedCGFloatPicker) -> Void) -> CGFloat {
        let picker = ScreenSizeBasedCGFloatPicker(defaultValue: defaultValue)
        build(picker)
        return picker.constraints.first { $0.condition(UIScreen.main.bounds.size) }?.value ?? picker.defaultValue
    }

}


public class ScreenSizeBasedCGFloatConstraints {

    private weak var picker: ScreenSizeBasedCGFloatPicker?
    public let condition: (CGSize) -> Bool
    public private(set) var value: CGFloat = 0


    fileprivate init(for picker: ScreenSizeBasedCGFloatPicker, constraints: @escaping (CGSize) -> Bool) {
        self.picker = picker
        self.condition = constraints
    }


    public func width(_ relation: @escaping (CGFloat, CGFloat) -> Bool, _ criteria: CGFloat) -> ScreenSizeBasedCGFloatConstraints {
        guard let picker = self.picker else {
            return self
        }

        return ScreenSizeBasedCGFloatConstraints(for: picker) { [weak self] size in
            var result = true

            if let previous = self?.condition(size) {
                result = previous
            }

            result = result && relation(size.width, criteria)
            return result
        }
    }


    public func height(_ relation: @escaping (CGFloat, CGFloat) -> Bool, _ criteria: CGFloat) -> ScreenSizeBasedCGFloatConstraints {
        guard let picker = self.picker else {
            return self
        }

        return ScreenSizeBasedCGFloatConstraints(for: picker) { [weak self] size in
            var result = true

            if let previous = self?.condition(size) {
                result = previous
            }

            result = result && relation(size.height, criteria)
            return result
        }
    }


    public func replace(to value: CGFloat) {
        self.value = value
        self.picker?.constraints.append(self)
    }

}
