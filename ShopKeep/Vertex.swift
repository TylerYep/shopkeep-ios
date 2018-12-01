//
//  Vertex.swift
//  ShopKeep
//
//  Created by Adam Halper on 11/29/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import Foundation
import UIKit


public struct Vertex {
    var data: CGPoint
}


extension Vertex: Hashable {

    public static func == (lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data

    }

    public var hashValue: Int { // 1
        return "\(data.x)\(data.y)".hashValue
    }

}

extension Vertex {


    public var description: CGPoint {
        return data
    }
}
