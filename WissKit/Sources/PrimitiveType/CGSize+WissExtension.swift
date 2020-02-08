//
// Created by Alan on 2020/02/07.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation
import UIKit


extension CGSize {

    public init(sideLengthOfSquare length: CGFloat) {
        self.init(width: length, height: length)
    }

}


extension CGSize {

    public static func * (scalar: CGFloat, size: CGSize) -> CGSize {
        CGSize(width: scalar * size.width, height: scalar * size.height)
    }


    public static func * (size: CGSize, scalar: CGFloat) -> CGSize {
        scalar * size
    }


    public static func *= (size: inout CGSize, scalar: CGFloat) {
        size = size * scalar
    }

}
