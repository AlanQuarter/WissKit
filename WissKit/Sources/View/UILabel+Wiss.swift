//
// Created by Alan on 2020/02/11.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation
import UIKit


extension Wiss where WissBase: UILabel {

    public var hidableText: String? {
        get {
            if self.base.isHidden {
                return nil
            }

            return self.base.text
        }

        set {
            self.base.text = newValue
            self.base.isHidden = newValue == nil
        }
    }

    public var hidableAttributedText: NSAttributedString? {
        get {
            if self.base.isHidden {
                return nil
            }

            return self.base.attributedText
        }

        set {
            self.base.attributedText = newValue
            self.base.isHidden = newValue == nil
        }
    }

}
