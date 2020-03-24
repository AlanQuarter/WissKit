//
// Created by Alan on 2020/03/24.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


public enum ANSIAttribute {

    case `default`
    case bold
    case italic
    case underline
    case strike
    case border
    case textColor(ANSI24BitColor)
    case backgroundColor(ANSI24BitColor)

}


extension ANSIAttribute {

    var code: String {
        var result = "\u{001B}["

        switch self {
        case .default:
            result += "0"

        case .bold:
            result += "1"

        case .italic:
            result += "3"

        case .underline:
            result += "4"

        case .strike:
            result += "9"

        case .border:
            result += "51"

        case let .textColor(color):
            result += "38;2;\(color.red);\(color.green);\(color.blue)"

        case let .backgroundColor(color):
            result += "48;2;\(color.red);\(color.green);\(color.blue)"
        }

        result += "m"
        return result
    }


    public static func ~ (lhs: ANSIAttribute, rhs: ANSIAttribute) -> Bool {
        switch (lhs, rhs) {
        case (.textColor, .textColor),
             (.backgroundColor, .backgroundColor):
            return true

        default:
            return lhs == rhs
        }
    }

}


extension ANSIAttribute: Equatable {

    public static func == (lhs: ANSIAttribute, rhs: ANSIAttribute) -> Bool {
        lhs.code == rhs.code
    }

}


extension ANSIAttribute: Hashable {

    public var hashValue: Int {
        self.code.hashValue
    }

}
