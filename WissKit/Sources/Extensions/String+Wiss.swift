//
// Created by Alan on 2020/02/05.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


extension String: WissCompatible {}


extension Wiss where WissBase == String {

    public func decodedValue<T: Decodable>() throws -> T {
        guard let data = self.base.data(using: .utf8) else {
            throw WissKitError.decodingFailed
        }

        return try JSONDecoder().decode(T.self, from: data)
    }

}


extension Wiss where WissBase == String {

    public static var defaultLocalizationLanguage: String? {
        get {
            do {
                return try Self.value(forKey: .wiss_defaultLocalizationLanguage)
            } catch {
                print(error)
                return nil
            }
        }

        set {
            do {
                try Self.set(newValue, forKey: .wiss_defaultLocalizationLanguage)
            } catch {
                print(error)
            }
        }
    }


    private static var defaultLocalizationBundle: Bundle? {
        do {
            if let bundle = try Self.value(forKey: .wiss_defaultLocalizationBundle) {
                return bundle
            }

            guard let defaultLanguage = Self.defaultLocalizationLanguage,
                  let bundlePath = Bundle.main.path(forResource: defaultLanguage, ofType: "lproj"),
                  let bundle = Bundle(path: bundlePath) else {
                return nil
            }

            try Self.set(bundle, forKey: .wiss_defaultLocalizationBundle)
            return bundle
        } catch {
            print(error)
            return nil
        }
    }


    public var localized: String {
        self.localized(for: Self.defaultLocalizationLanguage)
    }


    public func localized(for language: String?) -> String {
        let defaultValue = Self.defaultLocalizationBundle?.localizedString(forKey: self.base, value: nil, table: nil) ?? ""
        return NSLocalizedString(self.base, value: defaultValue, comment: "")
    }

}


extension Wiss where WissBase == String {

    public var wholeNsRange: NSRange {
        self.nsRange(of: self.base)
    }


    public func nsRange(of substring: String) -> NSRange {
        (self.base as NSString).range(of: substring)
    }

}


extension WissStoreKey {

    fileprivate static var wiss_defaultLocalizationLanguage: WissStoreKey<String?> {
        WissStoreKey<String?>(storeType: .memoryAndUserDefaults, keyName: "defaultLocalizationLanguage")
    }

    fileprivate static var wiss_defaultLocalizationBundle: WissStoreKey<Bundle?> {
        WissStoreKey<Bundle?>(keyName: "defaultLocalizationBundle")
    }
    
}
