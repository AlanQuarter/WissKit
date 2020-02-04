//
// Created by Alan on 2020/02/05.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


public struct Wiss<Base> {

    public let base: Base


    public init(_ base: Base) {
        self.base = base
    }

}


extension Wiss {

    public static subscript(key: String) -> Any? {
        get {
            WissStore.shared[Base.self, key]
        }

        set {
            WissStore.shared[Base.self, key] = newValue
        }
    }


    public static subscript<E: RawRepresentable>(key: E) -> Any? where E.RawValue == String {
        get {
            WissStore.shared[Base.self, key]
        }

        set {
            WissStore.shared[Base.self, key] = newValue
        }
    }

}


extension Wiss where Base: Hashable {

    public subscript(key: String) -> Any? {
        get {
            WissStore.shared[self.base, key]
        }

        set {
            WissStore.shared[self.base, key] = newValue
        }
    }


    public subscript<E: RawRepresentable>(key: E) -> Any? where E.RawValue == String {
        get {
            WissStore.shared[self.base, key]
        }

        set {
            WissStore.shared[self.base, key] = newValue
        }
    }

}


public protocol WissCompatible {

    associatedtype WissBase


    static var ws: Wiss<WissBase>.Type { get set }

    var ws: Wiss<WissBase> { get set }

}


extension WissCompatible {

    public static var ws: Wiss<Self>.Type {
        get {
            Wiss<Self>.self
        }

        set {}
    }


    public var ws: Wiss<Self> {
        get {
            Wiss(self)
        }

        set {}
    }

}
