//
// Created by Alan on 2020/02/09.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation
import UIKit


extension UIColor {

    convenience init(r: UInt8, g: UInt8, b: UInt8, a: CGFloat = 1) {
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: a)
    }

}
