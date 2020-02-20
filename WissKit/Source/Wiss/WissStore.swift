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


    func value<WissBase, ValueType>(forType type: WissBase.Type, key: WissStoreKey<ValueType>) throws -> ValueType {
        switch key.storeType {
        case .memory:
            return self.valueFromMemory(forKeyString: key.keyString(for: type), defaultValue: key.defaultValue)
            
        case .memoryAndUserDefaults:
            throw WissKitError.valueNotCodable
        }
    }


    func value<WissBase, ValueType>(forType type: WissBase.Type, key: WissStoreKey<ValueType?>) throws -> ValueType? {
        switch key.storeType {
        case .memory:
            return self.valueFromMemory(forKeyString: key.keyString(for: type), defaultValue: key.defaultValue)

        case .memoryAndUserDefaults:
            throw WissKitError.valueNotCodable
        }
    }


    func value<WissBase, ValueType: Codable>(forType type: WissBase.Type, key: WissStoreKey<ValueType>) throws -> ValueType {
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


    func value<WissBase, ValueType: Codable>(forType type: WissBase.Type, key: WissStoreKey<ValueType?>) throws -> ValueType? {
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


    func value<WissBase: Hashable, ValueType>(forInstance instance: WissBase, key: WissStoreKey<ValueType>) throws -> ValueType {
        switch key.storeType {
        case .memory:
            return self.valueFromMemory(forKeyString: key.keyString(for: instance), defaultValue: key.defaultValue)
            
        case .memoryAndUserDefaults:
            throw WissKitError.userDefaultsNotAvailable
        }
    }


    func value<WissBase: Hashable, ValueType>(forInstance instance: WissBase, key: WissStoreKey<ValueType?>) throws -> ValueType? {
        switch key.storeType {
        case .memory:
            return self.valueFromMemory(forKeyString: key.keyString(for: instance), defaultValue: key.defaultValue)

        case .memoryAndUserDefaults:
            throw WissKitError.userDefaultsNotAvailable
        }
    }


    func set<WissBase, ValueType>(_ value: ValueType, forType type: WissBase.Type, key: WissStoreKey<ValueType>) throws {
        switch key.storeType {
        case .memory:
            self.memoryData[key.keyString(for: type)] = value

        case .memoryAndUserDefaults:
            throw WissKitError.valueNotCodable
        }
    }


    func set<WissBase, ValueType: Codable>(_ value: ValueType, forType type: WissBase.Type, key: WissStoreKey<ValueType>) throws {
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


    func set<WissBase, ValueType: Codable>(_ value: ValueType?, forType type: WissBase.Type, key: WissStoreKey<ValueType?>) throws {
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


    func set<WissBase: Hashable, ValueType>(_ value: ValueType, forInstance instance: WissBase, key: WissStoreKey<ValueType>) throws {
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


    private func valueFromMemory<ValueType>(forKeyString keyString: String, defaultValue: ValueType) -> ValueType {
        if let value = self.memoryData[keyString] as? ValueType {
            return value
        }

        self.memoryData[keyString] = defaultValue
        return defaultValue
    }


    private func valueFromMemory<ValueType>(forKeyString keyString: String, defaultValue: ValueType?) -> ValueType? {
        if let value = self.memoryData[keyString] as? ValueType?,
           value != nil {
            return value
        }

        self.memoryData[keyString] = defaultValue
        return defaultValue
    }


    private func valueFromUserDefaults<WissBase, ValueType: Codable>(forType type: WissBase.Type, key: WissStoreKey<ValueType>) throws -> ValueType? {
        guard let userDefaults = self.userDefaults else {
            throw WissKitError.userDefaultsNotFound
        }
        
        if let value = self.memoryData[key.keyString(for: type)] as? ValueType {
            return value
        }

        if let json = userDefaults.value(forKey: key.keyString(for: type)) as? String {
            let value: ValueType = try json.wiss.decodedValue()
            self.memoryData[key.keyString(for: type)] = value
            return value
        }

        return nil
    }


    private func valueFromUserDefaults<WissBase, ValueType: Codable>(forType type: WissBase.Type, key: WissStoreKey<ValueType?>) throws -> ValueType? {
        guard let userDefaults = self.userDefaults else {
            throw WissKitError.userDefaultsNotFound
        }

        if let value = self.memoryData[key.keyString(for: type)] as? ValueType,
           value != nil {
            return value
        }

        if let json = userDefaults.value(forKey: key.keyString(for: type)) as? String {
            let value: ValueType = try json.wiss.decodedValue()
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
