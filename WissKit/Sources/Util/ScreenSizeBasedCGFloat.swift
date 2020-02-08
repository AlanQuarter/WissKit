//
// Created by Alan on 2020/02/08.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation
import UIKit


public class ScreenSizeBasedCGFloat {

    private let picker: ScreenSizeBasedCGFloatPicker
    public let constraints: (CGSize) -> Bool
    public private(set) var value = CGFloat.zero


    fileprivate init(for picker: ScreenSizeBasedCGFloatPicker, constraints: @escaping (CGSize) -> Bool) {
        self.picker = picker
        self.constraints = constraints
    }


    public func width(_ relation: @escaping (CGFloat, CGFloat) -> Bool, _ criteria: CGFloat) -> ScreenSizeBasedCGFloat {
        ScreenSizeBasedCGFloat(for: self.picker) { [weak self] size in
            var result = true

            if let previous = self?.constraints(size) {
                result = previous
            }

            result = result && relation(size.width, criteria)
            return result
        }
    }


    public func height(_ relation: @escaping (CGFloat, CGFloat) -> Bool, _ criteria: CGFloat) -> ScreenSizeBasedCGFloat {
        ScreenSizeBasedCGFloat(for: self.picker) { [weak self] size in
            var result = true

            if let previous = self?.constraints(size) {
                result = previous
            }

            result = result && relation(size.height, criteria)
            return result
        }
    }


    public func replace(to value: CGFloat) {
        self.value = value
        self.picker.append(self)
    }

}


public class ScreenSizeBasedCGFloatPicker {

    public private(set) var alternativeList: [ScreenSizeBasedCGFloat] = []
    public let defaultValue: CGFloat


    init(defaultValue: CGFloat) {
        self.defaultValue = defaultValue
    }


    public func width(_ relation: @escaping (CGFloat, CGFloat) -> Bool, _ criteria: CGFloat) -> ScreenSizeBasedCGFloat {
        ScreenSizeBasedCGFloat(for: self) { relation($0.width, criteria) }
    }


    public func height(_ relation: @escaping (CGFloat, CGFloat) -> Bool, _ criteria: CGFloat) -> ScreenSizeBasedCGFloat {
        ScreenSizeBasedCGFloat(for: self) { relation($0.height, criteria) }
    }


    static func pick(with defaultValue: CGFloat, _ build: (ScreenSizeBasedCGFloatPicker) -> Void) -> CGFloat {
        let picker = ScreenSizeBasedCGFloatPicker(defaultValue: defaultValue)
        build(picker)
        return picker.alternativeList.first { $0.constraints(UIScreen.main.bounds.size) }?.value ?? picker.defaultValue
    }


    fileprivate func append(_ alternative: ScreenSizeBasedCGFloat) {
        self.alternativeList.append(alternative)
    }

}
