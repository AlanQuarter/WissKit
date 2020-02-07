//
// Created by Alan on 2020/02/05.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


extension String: WissCompatible {}


extension Wiss where WissBase == String {

    public static var defaultLocalizationLanguage: String? {
        get {
            Self[.memoryAndUserDefaults, Key.defaultLocalizationLanguage] as String?
        }

        set {
            Self[.memoryAndUserDefaults, Key.defaultLocalizationLanguage] = newValue
        }
    }

    private static var defaultLocalizationBundle: Bundle? {
        if let bundle = Self[.memory, Key.defaultLocalizationBundle] as Bundle? {
            return bundle
        }

        guard let defaultLanguage = Self.defaultLocalizationLanguage,
              let bundlePath = Bundle.main.path(forResource: defaultLanguage, ofType: "lproj"),
              let bundle = Bundle(path: bundlePath) else {
            return nil
        }

        Self[.memory, Key.defaultLocalizationBundle] = bundle
        return bundle
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


extension Wiss where WissBase == String {

    enum Key: String {

        case defaultLocalizationBundle
        case defaultLocalizationLanguage

    }

}
