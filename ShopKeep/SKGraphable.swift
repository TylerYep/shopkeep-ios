//
//  SKGraphable.swift
//  ShopKeep
//
//  Created by Adam Halper on 12/1/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import Foundation

public protocol Graphable {
    associatedtype Element: Hashable
    var description: CustomStringConvertible { get }

    func createVertex(data: Element) -> Vertex<Element>
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
    func edges(from source: Vertex<Element>) -> [Edge<Element>]?
}
