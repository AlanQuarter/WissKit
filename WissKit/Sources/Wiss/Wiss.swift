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

    public static func value<ValueType>(forKey key: WissStoreKey<ValueType>) throws -> ValueType {
        try WissStore.shared.value(forType: WissBase.self, key: key)
    }


    public static func value<ValueType>(forKey key: WissStoreKey<ValueType?>) throws -> ValueType? {
        try WissStore.shared.value(forType: WissBase.self, key: key)
    }


    public static func value<ValueType: Codable>(forKey key: WissStoreKey<ValueType>) throws -> ValueType {
        try WissStore.shared.value(forType: WissBase.self, key: key)
    }


    public static func value<ValueType: Codable>(forKey key: WissStoreKey<ValueType?>) throws -> ValueType? {
        try WissStore.shared.value(forType: WissBase.self, key: key)
    }


    public static func set<ValueType>(_ value: ValueType, forKey key: WissStoreKey<ValueType>) throws {
        try WissStore.shared.set(value, forType: WissBase.self, key: key)
    }


    public static func set<ValueType: Codable>(_ value: ValueType, forKey key: WissStoreKey<ValueType>) throws {
        try WissStore.shared.set(value, forType: WissBase.self, key: key)
    }


    public static func set<ValueType: Codable>(_ value: ValueType?, forKey key: WissStoreKey<ValueType?>) throws {
        try WissStore.shared.set(value, forType: WissBase.self, key: key)
    }

}


extension Wiss where WissBase: Hashable {

    public func value<ValueType>(forKey key: WissStoreKey<ValueType>) throws -> ValueType {
        try WissStore.shared.value(forInstance: self.base, key: key)
    }


    public func value<ValueType>(forKey key: WissStoreKey<ValueType?>) throws -> ValueType? {
        try WissStore.shared.value(forInstance: self.base, key: key)
    }
    
    
    public func set<T>(_ value: T, forKey key: WissStoreKey<T>) throws {
        try WissStore.shared.set(value, forInstance: self.base, key: key)
    }


    public func flushStoredValues() {
        WissStore.shared.flush(for: self.base)
    }

}
