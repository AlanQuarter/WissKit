//
// Created by Alan on 2020/02/09.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation
import UIKit


extension UIFont: WissCompatible {}


extension Wiss where WissBase: UIFont {

    public static func italicFont(ofSize fontSize: CGFloat, degree: CGFloat = 13) -> UIFont {
        let matrix = CGAffineTransform(a: 1, b: 0, c: tan(degree * .pi / 180), d: 1, tx: 0, ty: 0)
        let descriptor = UIFontDescriptor(name: "", matrix: matrix)
        return UIFont(descriptor: descriptor, size: fontSize)
    }

}
