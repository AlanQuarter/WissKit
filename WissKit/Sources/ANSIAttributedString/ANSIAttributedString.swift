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


    public init(string: String) {
        self.string = string
    }

}


extension ANSIAttributedString {

    public func bold(_ bold: Bool = true) -> ANSIAttributedString {
        var newString = self
        newString.isBold = bold
        return newString
    }


    public func italic(_ italic: Bool = true) -> ANSIAttributedString {
        var newString = self
        newString.isItalic = italic
        return newString
    }


    public func underlined(_ underlined: Bool = true) -> ANSIAttributedString {
        var newString = self
        newString.isUnderlined = underlined
        return newString
    }


    public func textColored(_ color: ANSIColor) -> ANSIAttributedString {
        var newString = self
        newString.textColor = color
        return newString
    }


    public func backgroundColored(_ color: ANSIColor) -> ANSIAttributedString {
        var newString = self
        newString.backgroundColor = color
        return newString
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
