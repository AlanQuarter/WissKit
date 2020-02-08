//
// Created by Alan on 2020/02/09.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation
import UIKit


extension NSAttributedString: WissCompatible {}


extension Wiss where WissBase: NSAttributedString {

    public func boundingRect(maxWidth: CGFloat = .greatestFiniteMagnitude, maxHeight: CGFloat = .greatestFiniteMagnitude) -> CGRect {
        self.base.boundingRect(
                with: CGSize(width: maxWidth, height: maxHeight),
                options: [.usesLineFragmentOrigin, .usesFontLeading],
                context: nil
        )
    }

}
