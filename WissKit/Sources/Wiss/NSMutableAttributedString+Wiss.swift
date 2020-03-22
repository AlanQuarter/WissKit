//
// Created by Alan on 2020/02/21.
// Copyright (c) 2020 Wiss. All rights reserved.
//


#if os(iOS)

import Foundation
import UIKit


extension Wiss where WissBase: NSMutableAttributedString {

    public func add(font: UIFont, range: NSRange? = nil) {
        let actualRange = range ?? self.base.string.wiss.wholeNsRange

        guard actualRange.length > 0 else {
            return
        }

        self.base.addAttribute(.font, value: font, range: actualRange)
    }


    public func add(alignment: NSTextAlignment, range: NSRange? = nil) {
        var actualRange = range ?? self.base.string.wiss.wholeNsRange

        guard actualRange.length > 0 else {
            return
        }

        let paragraphStyle: NSMutableParagraphStyle

        if let style = self.base.attribute(.paragraphStyle, at: actualRange.location, effectiveRange: &actualRange) as? NSParagraphStyle,
           let mutableStyle = style.mutableCopy() as? NSMutableParagraphStyle {
            paragraphStyle = mutableStyle
        } else {
            paragraphStyle = NSMutableParagraphStyle()
        }

        paragraphStyle.alignment = alignment
        self.base.addAttribute(.paragraphStyle, value: paragraphStyle, range: actualRange)
    }


    public func add(lineBreakMode: NSLineBreakMode, range: NSRange? = nil) {
        var actualRange = range ?? self.base.string.wiss.wholeNsRange

        guard actualRange.length > 0 else {
            return
        }

        let paragraphStyle: NSMutableParagraphStyle

        if let style = self.base.attribute(.paragraphStyle, at: actualRange.location, effectiveRange: &actualRange) as? NSParagraphStyle,
           let mutableStyle = style.mutableCopy() as? NSMutableParagraphStyle {
            paragraphStyle = mutableStyle
        } else {
            paragraphStyle = NSMutableParagraphStyle()
        }

        paragraphStyle.lineBreakMode = lineBreakMode
        self.base.addAttribute(.paragraphStyle, value: paragraphStyle, range: actualRange)
    }


    public func add(lineHeight: CGFloat, range: NSRange? = nil) {
        var actualRange = range ?? self.base.string.wiss.wholeNsRange

        guard actualRange.length > 0 else {
            return
        }

        let paragraphStyle: NSMutableParagraphStyle

        if let style = self.base.attribute(.paragraphStyle, at: actualRange.location, effectiveRange: &actualRange) as? NSParagraphStyle,
           let mutableStyle = style.mutableCopy() as? NSMutableParagraphStyle {
            paragraphStyle = mutableStyle
        } else {
            paragraphStyle = NSMutableParagraphStyle()
        }

        paragraphStyle.lineHeightMultiple = self.base.wiss.lineHeightMultiple(for: lineHeight)
        self.base.addAttribute(.paragraphStyle, value: paragraphStyle, range: actualRange)
    }


    public func add(textColor: UIColor, range: NSRange? = nil) {
        let actualRange = range ?? self.base.string.wiss.wholeNsRange

        guard actualRange.length > 0 else {
            return
        }

        self.base.addAttribute(.foregroundColor, value: textColor, range: actualRange)
    }


    public func add(letterSpacing: CGFloat, range: NSRange? = nil) {
        let actualRange = range ?? self.base.string.wiss.wholeNsRange

        guard actualRange.length > 0 else {
            return
        }

        self.base.addAttribute(.kern, value: letterSpacing, range: actualRange)
    }

}

#endif
