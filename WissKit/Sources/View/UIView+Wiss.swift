//
// Created by Alan on 2020/02/11.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation
import UIKit


extension UIView: WissCompatible {}


extension Wiss where WissBase: UIView {

    public var cornerRadius: CGFloat {
        get {
            self.base.layer.cornerRadius
        }

        set {
            self.base.layer.cornerRadius = newValue
            self.base.layer.masksToBounds = newValue > 0
        }
    }

    public var borderWidth: CGFloat {
        get {
            self.base.layer.borderWidth
        }

        set {
            self.base.layer.borderWidth = newValue
        }
    }

    public var borderColor: UIColor? {
        get {
            guard let cgColor = self.base.layer.borderColor else {
                return nil
            }

            return UIColor(cgColor: cgColor)
        }

        set {
            self.base.layer.borderColor = newValue?.cgColor
        }
    }

}
