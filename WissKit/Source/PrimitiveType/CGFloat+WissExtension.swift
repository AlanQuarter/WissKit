//
// Created by Alan on 2020/02/08.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation
import UIKit


extension CGFloat {

    public init(_ defaultValue: CGFloat, _ constraintBuilder: @escaping (ScreenSizeBasedCGFloatPicker) -> Void) {
        self.init(ScreenSizeBasedCGFloatPicker.pick(with: defaultValue, constraintBuilder))
    }

}
