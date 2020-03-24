//
// Created by Alan on 2020/03/24.
// Copyright (c) 2020 Wiss. All rights reserved.
//


import Foundation


public struct ANSIAttributedString {

    public var string: String
    public private(set) var attributes: [ANSIAttribute] = []


    public init(string: String) {
        self.string = string
    }


    public mutating func add(_ attributes: ANSIAttribute...) {
        self.add(attributes)
    }


    public mutating func add(_ attributes: [ANSIAttribute]) {
        for attribute in attributes {
            self.attributes.removeAll { $0 ~ attribute }
            self.attributes.append(attribute)
        }
    }


    public func added(_ attributes: ANSIAttribute...) -> ANSIAttributedString {
        self.added(attributes)
    }


    public func added(_ attributes: [ANSIAttribute]) -> ANSIAttributedString {
        var result = self
        result.add(attributes)
        return result
    }

}


extension ANSIAttributedString: CustomStringConvertible {

    public var description: String {
        self.attributes.reduce("") { $0 + $1.code } + self.string + ANSIAttribute.default.code
    }

}
