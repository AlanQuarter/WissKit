//
// Created by Alan on 2020/02/05.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


final class WissStore {

    static let shared = WissStore()


    private var memoryData: [String: Any]
    private let userDefaults: UserDefaults?


    private init() {
        self.memoryData = [:]
        self.userDefaults = UserDefaults(suiteName: "Wiss")
    }


    subscript(key: WissStoreKey) -> Any? {
        get {
            switch key.storeType {
            case .memory:
                return self.memoryData[key.keyString]

            case .userDefaults:
                return self.userDefaults?.value(forKey: key.keyString)
            }
        }

        set {
            switch key.storeType {
            case .memory:
                self.memoryData[key.keyString] = newValue

            case .userDefaults:
                self.userDefaults?.setValue(newValue, forKey: key.keyString)
            }
        }
    }

}


public enum WissStoreType {

    case memory
    case userDefaults

}


struct WissStoreKey {

    let storeType: WissStoreType
    let keyString: String


    init<WissBase>(storeType: WissStoreType, type: WissBase.Type, keyName: String) {
        self.storeType = storeType
        self.keyString = "\(type).\(keyName)"
    }


    init<WissBase: Hashable>(storeType: WissStoreType, instance: WissBase, keyName: String) {
        self.storeType = storeType
        self.keyString = "\(type(of: instance)).\(instance.hashValue).\(keyName)"
    }

}


public protocol WissStoreKeyExpression: RawRepresentable where Self.RawValue == String {

    var storeType: WissStoreType { get }

}


extension WissStoreKeyExpression {

    func key<WissBase>(for type: WissBase.Type) -> WissStoreKey {
        WissStoreKey(storeType: self.storeType, type: type, keyName: self.rawValue)
    }


    func key<WissBase: Hashable>(for instance: WissBase) -> WissStoreKey {
        WissStoreKey(storeType: self.storeType, instance: instance, keyName: self.rawValue)
    }

}
