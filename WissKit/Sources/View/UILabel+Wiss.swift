//
// Created by Alan on 2020/02/11.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation
import UIKit


extension Wiss where WissBase: UILabel {

    public func setTextOrHideIfNil(_ text: String?) {
        self.base.text = text
        self.base.isHidden = text == nil
    }


    public func setAttributedTextOrHideIfNil(_ attributedText: NSAttributedString?) {
        self.base.attributedText = attributedText
        self.base.isHidden = attributedText == nil
    }

}
