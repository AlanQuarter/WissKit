//
// Created by Alan on 2020/03/24.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


public struct ANSI24BitColor {

    public var red: UInt8
    public var green: UInt8
    public var blue: UInt8

}


extension ANSI24BitColor {

    public static let black = ANSI24BitColor(red: 0, green: 0, blue: 0)

    public static let darkGray = ANSI24BitColor(red: 85, green: 85, blue: 85)

    public static let gray = ANSI24BitColor(red: 128, green: 128, blue: 128)

    public static let lightGray = ANSI24BitColor(red: 170, green: 170, blue: 170)

    public static let silver = ANSI24BitColor(red: 192, green: 192, blue: 192)

    public static let white = ANSI24BitColor(red: 255, green: 255, blue: 255)

}


extension ANSI24BitColor {

    public static let red = ANSI24BitColor(red: 255, green: 0, blue: 0)

    public static let maroon = ANSI24BitColor(red: 128, green: 0, blue: 0)

    public static let green = ANSI24BitColor(red: 0, green: 255, blue: 0)

    public static let darkGreen = ANSI24BitColor(red: 0, green: 128, blue: 0)

    public static let blue = ANSI24BitColor(red: 0, green: 0, blue: 255)

    public static let navy = ANSI24BitColor(red: 0, green: 0, blue: 128)

    public static let cyan = ANSI24BitColor(red: 0, green: 255, blue: 255)

    public static let teal = ANSI24BitColor(red: 0, green: 128, blue: 128)

    public static let yellow = ANSI24BitColor(red: 255, green: 255, blue: 0)

    public static let olive = ANSI24BitColor(red: 128, green: 128, blue: 0)

    public static let magenta = ANSI24BitColor(red: 255, green: 0, blue: 255)

    public static let purple = ANSI24BitColor(red: 128, green: 0, blue: 128)

}


extension ANSI24BitColor {

    public static let brown = ANSI24BitColor(red: 153, green: 102, blue: 51)

    public static let orange = ANSI24BitColor(red: 255, green: 128, blue: 0)

}


extension ANSI24BitColor {

    public static let terminalRed = ANSI24BitColor(red: 194, green: 54, blue: 33)

    public static let terminalGreen = ANSI24BitColor(red: 37, green: 188, blue: 36)

    public static let terminalYellow = ANSI24BitColor(red: 173, green: 173, blue: 39)

    public static let terminalBlue = ANSI24BitColor(red: 73, green: 46, blue: 225)

    public static let terminalMagenta = ANSI24BitColor(red: 211, green: 56, blue: 211)

    public static let terminalCyan = ANSI24BitColor(red: 51, green: 187, blue: 200)

    public static let terminalWhite = ANSI24BitColor(red: 203, green: 204, blue: 205)

    public static let terminalLightBlack = ANSI24BitColor(red: 129, green: 131, blue: 131)

    public static let terminalLightRed = ANSI24BitColor(red: 252, green: 57, blue: 31)

    public static let terminalLightGreen = ANSI24BitColor(red: 49, green: 231, blue: 34)

    public static let terminalLightYellow = ANSI24BitColor(red: 234, green: 236, blue: 35)

    public static let terminalLightBlue = ANSI24BitColor(red: 88, green: 51, blue: 255)

    public static let terminalLightMagenta = ANSI24BitColor(red: 249, green: 53, blue: 248)

    public static let terminalLightCyan = ANSI24BitColor(red: 20, green: 240, blue: 240)

    public static let terminalLightWhite = ANSI24BitColor(red: 233, green: 235, blue: 235)

}
