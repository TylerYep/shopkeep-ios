//
//  AdjacencyList.swift
//  ShopKeep
//
//  Created by Adam Halper on 11/29/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import Foundation

open class AdjacencyList<T: Hashable> {
    public var adjacencyDict : [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
}

extension AdjacencyList: Graphable {
    var description: CustomStringConvertible {
        var result = ""
        for (vertex, edges) in adjacencyDict {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ] \n ")
        }
        return result
    }

    func add(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        let edgeTo = Edge(source: source, destination: destination, weight: weight)
        adjacencyDict[source]?.append(edgeTo)
        let edgeFrom = Edge(source: destination, destination: source, weight: weight)
        adjacencyDict[destination]?.append(edgeFrom)
    }

    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        guard let edges = adjacencyDict[source] else {
            return nil
        }

        for edge in edges {
            if edge.destination == destination {
                return edge.weight
            }
        }

        return nil
    }

    func edges(from source: Vertex<T>) -> [Edge<T>]? {
        return adjacencyDict[source]
    }

    public typealias Element = T

    public func createVertex(data: Element) -> Vertex<Element> {
        let vertex = Vertex(data: data)

        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }

        return vertex
    }


}
