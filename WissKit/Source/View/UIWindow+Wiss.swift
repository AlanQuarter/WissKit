//
// Created by Alan on 2020/02/11.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation
import UIKit


extension Wiss where WissBase: UIWindow {

    public static var safeAreaInsets: UIEdgeInsets {
        guard #available(iOS 11.0, *) else {
            return .zero
        }

        return UIApplication.shared.keyWindow?.safeAreaInsets ?? .zero
    }

}
