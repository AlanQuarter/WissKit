//
// Created by Alan on 2020/02/05.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


extension Int: WissCompatible {}


extension Wiss where WissBase == Int {

    public var decimalString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(for: self.base) ?? "\(self.base)"
    }

}
