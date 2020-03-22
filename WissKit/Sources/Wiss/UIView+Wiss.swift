//
// Created by Alan on 2020/02/11.
// Copyright (c) 2020 Wiss. All rights reserved.
//


#if os(iOS)

import Foundation
import UIKit


extension UIView: WissCompatible {}


extension Wiss where WissBase: UIView {

    public func roundCorner(radius: CGFloat) {
        self.base.layer.cornerRadius = radius
        self.base.layer.masksToBounds = radius > 0
    }


    public func drawBorder(width: CGFloat, color: UIColor?) {
        self.base.layer.borderWidth = width
        self.base.layer.borderColor = color?.cgColor
    }

}

#endif
