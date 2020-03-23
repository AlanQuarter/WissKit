//
// Created by Alan on 2020/03/23.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


public struct ANSIColor {

    public var red: UInt8
    public var green: UInt8
    public var blue: UInt8

}


extension ANSIColor {

    public static let black = ANSIColor(red: 0, green: 0, blue: 0)

    public static let darkGray = ANSIColor(red: 255 / 3, green: 255 / 3, blue: 255 / 3)

    public static let lightGray = ANSIColor(red: UInt8(255 * 2 / 3), green: UInt8(255 * 2 / 3), blue: UInt8(255 * 2 / 3))

    public static let white = ANSIColor(red: 255, green: 255, blue: 255)

    public static let gray = ANSIColor(red: 255 / 2, green: 255 / 2, blue: 255 / 2)

    public static let red = ANSIColor(red: 255, green: 0, blue: 0)

    public static let green = ANSIColor(red: 0, green: 255, blue: 0)

    public static let blue = ANSIColor(red: 0, green: 0, blue: 255)

    public static let cyan = ANSIColor(red: 0, green: 255, blue: 255)

    public static let yellow = ANSIColor(red: 255, green: 255, blue: 0)

    public static let magenta = ANSIColor(red: 255, green: 0, blue: 255)

    public static let orange = ANSIColor(red: 255, green: 255 / 2, blue: 0)

    public static let purple = ANSIColor(red: 255 / 2, green: 0, blue: 255 / 2)

    public static let brown = ANSIColor(red: UInt8(255 * 6 / 10), green: UInt8(255 * 4 / 10), blue: UInt8(255 * 2 / 10))

}
