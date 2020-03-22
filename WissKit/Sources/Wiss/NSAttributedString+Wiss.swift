//
// Created by Alan on 2020/02/09.
// Copyright (c) 2020 Wiss. All rights reserved.
//


#if os(iOS)

import Foundation
import UIKit


extension NSAttributedString: WissCompatible {}


extension Wiss where WissBase: NSAttributedString {

    public func lineHeightMultiple(for lineHeight: CGFloat) -> CGFloat {
        let attributedString = NSAttributedString(string: "Wiss", attributes: self.base.attributes(at: 0, effectiveRange: nil))
        return lineHeight / attributedString.wiss.boundingRect().height
    }

}


extension Wiss where WissBase: NSAttributedString {

    public func boundingRect(maxWidth: CGFloat = .greatestFiniteMagnitude, maxHeight: CGFloat = .greatestFiniteMagnitude) -> CGRect {
        let textContainer = NSTextContainer(size: CGSize(width: maxWidth, height: maxHeight))
        textContainer.lineFragmentPadding = 0

        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(textContainer)

        let storage = NSTextStorage(attributedString: self.base)
        storage.addLayoutManager(layoutManager)

        var glyphRange = NSRange()
        layoutManager.characterRange(forGlyphRange: self.base.string.wiss.wholeNsRange, actualGlyphRange: &glyphRange)

        return layoutManager.boundingRect(forGlyphRange: glyphRange, in: textContainer)
    }

}

#endif
