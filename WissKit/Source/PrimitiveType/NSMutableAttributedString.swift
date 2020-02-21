//
// Created by Alan on 2020/02/21.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation
import UIKit


extension Wiss where WissBase: NSMutableAttributedString {

    public func add(lineHeight: CGFloat, range: NSRange? = nil) {
        var actualRange = range ?? self.base.string.wiss.wholeNsRange
        let paragraphStyle: NSMutableParagraphStyle

        if let style = self.base.attribute(.paragraphStyle, at: actualRange.location, effectiveRange: &actualRange) as? NSParagraphStyle,
           let mutableStyle = style.mutableCopy() as? NSMutableParagraphStyle {
            paragraphStyle = mutableStyle
        } else {
            paragraphStyle = NSMutableParagraphStyle()
        }

        paragraphStyle.lineHeightMultiple = self.base.wiss.lineHeightMultiple(for: lineHeight)
        self.base.setAttributes([.paragraphStyle: paragraphStyle], range: actualRange)
    }

}
