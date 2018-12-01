//
//  Edge.swift
//  ShopKeep
//
//  Created by Adam Halper on 11/29/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import Foundation

public struct Edge {
    public var source: Vertex // 1
    public var destination: Vertex
    public let weight: Double? // 2
}
