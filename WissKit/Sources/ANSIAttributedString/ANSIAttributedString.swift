//
// Created by Alan on 2020/03/24.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


public struct ANSIAttributedString {

    public var string: String
    public var isBold = false
    public var isItalic = false
    public var isUnderlined = false
    public var textColor: ANSIColor? = nil
    public var backgroundColor: ANSIColor? = nil


    init(string: String) {
        self.string = string
    }

}


extension ANSIAttributedString: CustomStringConvertible {

    public var description: String {
        var attributesDescription = ""

        if self.isBold {
            attributesDescription += "\u{001B}[1m"
        }

        if self.isItalic {
            attributesDescription += "\u{001B}[3m"
        }

        if self.isUnderlined {
            attributesDescription += "\u{001B}[4m"
        }

        if let color = self.textColor {
            attributesDescription += "\u{001B}[38;2;\(color.red);\(color.green);\(color.blue)m"
        }

        if let color = self.backgroundColor {
            attributesDescription += "\u{001B}[48;2;\(color.red);\(color.green);\(color.blue)m"
        }

        return attributesDescription + self.string + "\u{001B}[0m"
    }

}
