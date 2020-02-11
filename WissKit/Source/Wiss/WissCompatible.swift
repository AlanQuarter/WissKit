//
// Created by Alan on 2020/02/05.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


public protocol WissCompatible {

    associatedtype WissBase


    static var wiss: Wiss<WissBase>.Type { get set }

    var wiss: Wiss<WissBase> { get set }


    static var ws: Wiss<WissBase>.Type { get set }
    var ws: Wiss<WissBase> { get set }

}


extension WissCompatible {

    public static var wiss: Wiss<Self>.Type {
        get {
            Wiss<Self>.self
        }

        set {}
    }

    public var wiss: Wiss<Self> {
        get {
            Wiss(self)
        }

        set {}
    }


    @available(*, deprecated, message: "Use wiss.")
    public static var ws: Wiss<Self>.Type {
        get {
            Self.wiss
        }

        set {}
    }

    @available(*, deprecated, message: "Use wiss.")
    public var ws: Wiss<Self> {
        get {
            self.wiss
        }

        set {}
    }

}
