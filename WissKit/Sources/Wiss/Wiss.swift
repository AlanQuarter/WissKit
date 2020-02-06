//
// Created by Alan on 2020/02/05.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


public struct Wiss<WissBase> {

    public let base: WissBase
    private let deinitHandler: WissDeinitHandler


    public init(_ base: WissBase) {
        self.base = base
        self.deinitHandler = WissDeinitHandler {
            WissStore.shared.flush(for: base)
        }
    }

}


extension Wiss {

    public static subscript<T>(storeType: WissStoreType, keyName: String) -> T? {
        get {
            WissStore.shared[WissStoreKey(storeType: storeType, type: WissBase.self, keyName: keyName)]
        }

        set {
            WissStore.shared[WissStoreKey(storeType: storeType, type: WissBase.self, keyName: keyName)] = newValue
        }
    }


    public static subscript<E: RawRepresentable, T>(storeType: WissStoreType, keyDescription: E) -> T? where E.RawValue == String {
        get {
            WissStore.shared[WissStoreKey(storeType: storeType, type: WissBase.self, keyName: keyDescription.rawValue)]
        }

        set {
            WissStore.shared[WissStoreKey(storeType: storeType, type: WissBase.self, keyName: keyDescription.rawValue)] = newValue
        }
    }


    public static subscript<K: WissStoreKeyExpression, T>(keyExpression: K) -> T? {
        get {
            WissStore.shared[keyExpression.key(for: WissBase.self)]
        }

        set {
            WissStore.shared[keyExpression.key(for: WissBase.self)] = newValue
        }
    }

}


extension Wiss where WissBase: WissInstanceIdentifiable {

    public subscript<T>(storeType: WissStoreType, keyName: String) -> T? {
        get {
            WissStore.shared[WissStoreKey(storeType: storeType, instance: self.base, keyName: keyName)]
        }

        set {
            WissStore.shared[WissStoreKey(storeType: storeType, instance: self.base, keyName: keyName)] = newValue
        }
    }


    public subscript<E: RawRepresentable, T>(storeType: WissStoreType, keyDescription: E) -> T? where E.RawValue == String {
        get {
            WissStore.shared[WissStoreKey(storeType: storeType, instance: self.base, keyName: keyDescription.rawValue)]
        }

        set {
            WissStore.shared[WissStoreKey(storeType: storeType, instance: self.base, keyName: keyDescription.rawValue)] = newValue
        }
    }


    public subscript<K: WissStoreKeyExpression, T>(keyExpression: K) -> T? {
        get {
            WissStore.shared[keyExpression.key(for: self.base)]
        }

        set {
            WissStore.shared[keyExpression.key(for: self.base)] = newValue
        }
    }

}
