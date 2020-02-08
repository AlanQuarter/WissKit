//
// Created by Alan on 2020/02/09.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation
import UIKit


extension UIScreen: WissCompatible {}


extension Wiss where WissBase: UIScreen {

    public var onePixel: CGFloat {
        1 / self.base.scale
    }

}
