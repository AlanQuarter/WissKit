//
// Created by Alan on 2020/02/08.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation
import UIKit


public class ScreenSizeBasedCGFloatPicker {

    public internal(set) var constraints: [ScreenSizeBasedCGFloatConstraints] = []
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
