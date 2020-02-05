//
// Created by Alan on 2020/02/05.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


public struct Wiss<WissBase> {

    public let base: WissBase


    public init(_ base: WissBase) {
        self.base = base
    }

}


extension Wiss {

    public static subscript<Key: WissStoreKeyExpression>(keyExpression: Key) -> Any? {
        get {
            WissStore.shared[keyExpression.key(for: WissBase.self)]
        }

        set {
            WissStore.shared[keyExpression.key(for: WissBase.self)] = newValue
        }
    }

}


extension Wiss where WissBase: Hashable {

    public subscript<Key: WissStoreKeyExpression>(keyExpression: Key) -> Any? {
        get {
            WissStore.shared[keyExpression.key(for: self.base)]
        }

        set {
            WissStore.shared[keyExpression.key(for: self.base)] = newValue
        }
    }

}
