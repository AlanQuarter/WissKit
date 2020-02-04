//
// Created by Alan on 2020/02/05.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


final class WissStore {

    static let shared = WissStore()


    fileprivate var data: [String: Any] = [:]


    private init() {}

}


extension WissStore {

    subscript<WissBase>(type: WissBase.Type, key: String) -> Any? {
        get {
            self.data[self.keyPath(forType: type, key: key)]
        }

        set {
            self.data[self.keyPath(forType: type, key: key)] = newValue
        }
    }


    private func keyPath<WissBase>(forType type: WissBase, key: String) -> String {
        "\(type).\(key)"
    }

}


extension WissStore {

    subscript<WissBase, E: RawRepresentable>(type: WissBase.Type, key: E) -> Any? where E.RawValue == String {
        get {
            self.data[self.keyPath(forType: type, key: key)]
        }

        set {
            self.data[self.keyPath(forType: type, key: key)] = newValue
        }
    }


    private func keyPath<WissBase, E: RawRepresentable>(forType type: WissBase, key: E) -> String where E.RawValue == String {
        "\(type).\(key.rawValue)"
    }

}


extension WissStore {

    subscript<WissBase: Hashable>(instance: WissBase, key: String) -> Any? {
        get {
            self.data[self.keyPath(forInstance: instance, key: key)]
        }

        set {
            self.data[self.keyPath(forInstance: instance, key: key)] = newValue
        }
    }


    private func keyPath<WissBase: Hashable>(forInstance instance: WissBase, key: String) -> String {
        "\(instance.hashValue).\(key)"
    }

}


extension WissStore {

    subscript<WissBase: Hashable, E: RawRepresentable>(instance: WissBase, key: E) -> Any? where E.RawValue == String {
        get {
            self.data[self.keyPath(forInstance: instance, key: key)]
        }

        set {
            self.data[self.keyPath(forInstance: instance, key: key)] = newValue
        }
    }


    private func keyPath<WissBase: Hashable, E: RawRepresentable>(forInstance instance: WissBase, key: E) -> String where E.RawValue == String {
        "\(instance.hashValue).\(key.rawValue)"
    }

}
