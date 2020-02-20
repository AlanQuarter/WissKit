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


    func value<WissBase, T>(forType type: WissBase.Type, key: WissStoreKey<T>) throws -> T {
        print("[WK/WissStore] get Value 1, keyString = \(key.keyString(for: type))")

        switch key.storeType {
        case .memory:
            return self.valueFromMemory(forKeyString: key.keyString(for: type), defaultValue: key.defaultValue)
            
        case .memoryAndUserDefaults:
            throw WissKitError.valueNotCodable
        }
    }


    func value<WissBase, T: Codable>(forType type: WissBase.Type, key: WissStoreKey<T>) throws -> T {
        print("[WK/WissStore] get Value 2, keyString = \(key.keyString(for: type))")

        switch key.storeType {
        case .memory:
            return self.valueFromMemory(forKeyString: key.keyString(for: type), defaultValue: key.defaultValue)

        case .memoryAndUserDefaults:
            if let value = try self.valueFromUserDefaults(forType: type, key: key) {
                return value
            }
            
            guard let userDefaults = self.userDefaults else {
                throw WissKitError.userDefaultsNotFound
            }

            self.memoryData[key.keyString(for: type)] = key.defaultValue
            userDefaults.setValue(try key.defaultValue.wiss_jsonString(), forKey: key.keyString(for: type))
            return key.defaultValue
        }
    }


    func value<WissBase: Hashable, T>(forInstance instance: WissBase, key: WissStoreKey<T>) throws -> T {
        switch key.storeType {
        case .memory:
            return self.valueFromMemory(forKeyString: key.keyString(for: instance), defaultValue: key.defaultValue)
            
        case .memoryAndUserDefaults:
            throw WissKitError.userDefaultsNotAvailable
        }
    }


    func set<WissBase, T>(_ value: T, forType type: WissBase.Type, key: WissStoreKey<T>) throws {
        switch key.storeType {
        case .memory:
            self.memoryData[key.keyString(for: type)] = value

        case .memoryAndUserDefaults:
            throw WissKitError.valueNotCodable
        }
    }


    func set<WissBase, T: Codable>(_ value: T, forType type: WissBase.Type, key: WissStoreKey<T>) throws {
        switch key.storeType {
        case .memory:
            self.memoryData[key.keyString(for: type)] = value

        case .memoryAndUserDefaults:
            if let oldValue = try? self.valueFromUserDefaults(forType: type, key: key) as? WissEquatable,
               oldValue.wiss_isEqual(to: value) {
                return
            }
            
            guard let userDefaults = self.userDefaults else {
                throw WissKitError.userDefaultsNotFound
            }

            self.memoryData[key.keyString(for: type)] = value
            userDefaults.setValue(try value.wiss_jsonString(), forKey: key.keyString(for: type))
        }
    }


    func set<WissBase: Hashable, T>(_ value: T, forInstance instance: WissBase, key: WissStoreKey<T>) throws {
        switch key.storeType {
        case .memory:
            self.memoryData[key.keyString(for: instance)] = value
            
        case .memoryAndUserDefaults:
            throw WissKitError.userDefaultsNotAvailable
        }
    }


    func flush<WissBase: Hashable>(for instance: WissBase) {
        let prefix = instance.wiss_instanceId
        let keyList = self.memoryData.keys.filter { $0.hasPrefix(prefix) }

        for key in keyList {
            self.memoryData[key] = nil
        }
    }


    private func valueFromMemory<T>(forKeyString keyString: String, defaultValue: T) -> T {
        if let value = self.memoryData[keyString] as? T {
            return value
        }

        self.memoryData[keyString] = defaultValue
        return defaultValue
    }


    private func valueFromUserDefaults<WissBase, T: Codable>(forType type: WissBase.Type, key: WissStoreKey<T>) throws -> T? {
        guard let userDefaults = self.userDefaults else {
            throw WissKitError.userDefaultsNotFound
        }
        
        if let value = self.memoryData[key.keyString(for: type)] as? T {
            return value
        }

        if let json = userDefaults.value(forKey: key.keyString(for: type)) as? String {
            print("[WK/WissStore] userDefaults = \(userDefaults)")
            print("[WK/WissStore] keyString = \(key.keyString(for: type))")
            print("[WK/WissStore] json = \(json)")

            let value: T = try json.wiss.decodedValue()
            print("[WK/WissStore] value = \(value)")

            self.memoryData[key.keyString(for: type)] = value
            return value
        }

        return nil
    }

}


public struct WissStoreKey<ValueType> {

    public let storeType: WissStoreType
    public let keyName: String
    public let defaultValue: ValueType
    
    
    public init(storeType: WissStoreType = .memory, keyName: String, defaultValue: ValueType) {
        self.storeType = storeType
        self.keyName = keyName
        self.defaultValue = defaultValue
    }


    fileprivate func keyString<WissBase>(for type: WissBase.Type) -> String {
        "\(type).\(self.keyName)"
    }


    fileprivate func keyString<WissBase: Hashable>(for instance: WissBase) -> String {
        "\(instance.wiss_instanceId).\(self.keyName)"
    }

}


extension WissStoreKey where ValueType: ExpressibleByNilLiteral {

    public init(storeType: WissStoreType = .memory, keyName: String) {
        self.storeType = storeType
        self.keyName = keyName
        self.defaultValue = nil
    }
    
}


public enum WissStoreType {

    case memory
    case memoryAndUserDefaults

}
