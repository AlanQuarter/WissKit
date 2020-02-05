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

    public static subscript(storeType: WissStoreType, keyName: String) -> Any? {
        get {
            WissStore.shared[WissStoreKey(storeType: storeType, type: WissBase.self, keyName: keyName)]
        }

        set {
            WissStore.shared[WissStoreKey(storeType: storeType, type: WissBase.self, keyName: keyName)] = newValue
        }
    }


    public static subscript<E: RawRepresentable>(storeType: WissStoreType, keyDescription: E) -> Any? where E.RawValue == String {
        get {
            WissStore.shared[WissStoreKey(storeType: storeType, type: WissBase.self, keyName: keyDescription.rawValue)]
        }

        set {
            WissStore.shared[WissStoreKey(storeType: storeType, type: WissBase.self, keyName: keyDescription.rawValue)] = newValue
        }
    }


    public static subscript<K: WissStoreKeyExpression>(keyExpression: K) -> Any {
        get {
            WissStore.shared[keyExpression.key(for: WissBase.self)]
        }

        set {
            WissStore.shared[keyExpression.key(for: WissBase.self)] = newValue
        }
    }

}


extension Wiss where WissBase: Hashable {

    public subscript(storeType: WissStoreType, keyName: String) -> Any? {
        get {
            WissStore.shared[WissStoreKey(storeType: storeType, instance: self.base, keyName: keyName)]
        }

        set {
            WissStore.shared[WissStoreKey(storeType: storeType, instance: self.base, keyName: keyName)] = newValue
        }
    }


    public subscript<E: RawRepresentable>(storeType: WissStoreType, keyDescription: E) -> Any? where E.RawValue == String {
        get {
            WissStore.shared[WissStoreKey(storeType: storeType, instance: self.base, keyName: keyDescription.rawValue)]
        }

        set {
            WissStore.shared[WissStoreKey(storeType: storeType, instance: self.base, keyName: keyDescription.rawValue)] = newValue
        }
    }


    public subscript<K: WissStoreKeyExpression>(keyExpression: K) -> Any? {
        get {
            WissStore.shared[keyExpression.key(for: self.base)]
        }

        set {
            WissStore.shared[keyExpression.key(for: self.base)] = newValue
        }
    }

}
