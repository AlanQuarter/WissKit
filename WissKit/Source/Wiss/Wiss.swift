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
            Self[storeType, keyDescription.rawValue]
        }

        set {
            Self[storeType, keyDescription.rawValue] = newValue
        }
    }

}


extension Wiss where WissBase: InstanceIdentifiable {

    public subscript<T>(keyName: String) -> T? {
        get {
            WissStore.shared[WissStoreKey(instance: self.base, keyName: keyName)]
        }

        set {
            WissStore.shared[WissStoreKey(instance: self.base, keyName: keyName)] = newValue
        }
    }


    public subscript<E: RawRepresentable, T>(keyDescription: E) -> T? where E.RawValue == String {
        get {
            self[keyDescription.rawValue]
        }

        set {
            self[keyDescription.rawValue] = newValue
        }
    }


    public func flushStoredValues() {
        WissStore.shared.flushIfNeeded(for: self.base)
    }

}
