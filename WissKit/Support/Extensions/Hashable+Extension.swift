//
// Created by Alan on 2020/02/20.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


extension Hashable {
    
    var wiss_instanceId: String {
        "\(type(of: self)).\(self.hashValue)"
    }

}
