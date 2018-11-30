//
//  Vertex.swift
//  ShopKeep
//
//  Created by Adam Halper on 11/29/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import Foundation


public struct Vertex<T: Hashable> {
    var data: T
}


extension Vertex: Hashable {
    public var hashValue: Int { // 1
        return "\(data)".hashValue
    }

    static public func ==(lhs: Vertex, rhs: Vertex) -> Bool { // 2
        return lhs.data == rhs.data
    }
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}
