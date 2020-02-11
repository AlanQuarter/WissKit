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


    subscript<T>(key: WissStoreKey) -> T? {
        get {
            switch key.storeType {
            case .memory:
                return self.memoryData[key.keyString] as? T

            case .memoryAndUserDefaults:
                if let value = self.memoryData[key.keyString] {
                    return value as? T
                }

                if let value = self.userDefaults?.value(forKey: key.keyString) {
                    self.memoryData[key.keyString] = value
                    return value as? T
                }

                return nil
            }
        }

        set {
            switch key.storeType {
            case .memory:
                self.memoryData[key.keyString] = newValue

            case .memoryAndUserDefaults:
                if let oldValue = self[key] as WissEquatable? {
                    guard oldValue.wiss_isEqual(to: newValue) == false else {
                        return
                    }
                }

                self.memoryData[key.keyString] = newValue
                self.userDefaults?.setValue(newValue, forKey: key.keyString)
            }
        }
    }


    func flushIfNeeded<WissBase>(for instance: WissBase) {
        guard let prefix = try? WissStoreKey.prefix(for: instance) else {
            return
        }

        let keyList = self.memoryData.keys.filter { $0.hasPrefix(prefix) }

        for key in keyList {
            self.memoryData[key] = nil
        }
    }

}


public enum WissStoreType {

    case memory
    case memoryAndUserDefaults

}


struct WissStoreKey {

    let storeType: WissStoreType
    let keyString: String


    init<WissBase>(storeType: WissStoreType, type: WissBase.Type, keyName: String) {
        self.storeType = storeType
        self.keyString = "\(type).\(keyName)"
    }


    init<WissBase: InstanceIdentifiable>(instance: WissBase, keyName: String) {
        do {
            self.storeType = .memory
            self.keyString = "\(try Self.prefix(for: instance)).\(keyName)"
        } catch {
            fatalError(error.localizedDescription)
        }
    }


    fileprivate static func prefix<WissBase>(for instance: WissBase) throws -> String {
        guard let instanceIdentifiable = instance as? InstanceIdentifiable else {
            throw WissKitError.notInstanceIdentifiable
        }

        return "\(type(of: instance)).\(instanceIdentifiable.wiss_instanceId)"
    }

}
