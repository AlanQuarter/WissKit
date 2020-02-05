//
// Created by Alan on 2020/02/05.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


extension String: WissCompatible {}


extension Wiss where WissBase == String {


    static var defaultLocalizationLanguage: String? {
        get {
            Self[Key.defaultLocalizationLanguage] as? String
        }

        set {
            Self[Key.defaultLocalizationLanguage] = newValue
        }
    }

}


extension Wiss where WissBase == String {

    enum Key: String, WissStoreKeyExpression {

        case defaultLocalizationLanguage


        var storeType: WissStoreType {
            switch self {
            case .defaultLocalizationLanguage:
                return .userDefaults
            }
        }

    }

}
