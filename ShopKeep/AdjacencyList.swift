//
//  AdjacencyList.swift
//  ShopKeep
//
//  Created by Adam Halper on 11/29/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import UIKit

open class AdjacencyList {
    public var adjacencyDict : [Vertex: [Edge]] = [:]
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

    func add(from source: Vertex, to destination: Vertex, weight: Double?) {
        let edgeTo = Edge(source: source, destination: destination, weight: weight)
        adjacencyDict[source]?.append(edgeTo)
        let edgeFrom = Edge(source: destination, destination: source, weight: weight)
        adjacencyDict[destination]?.append(edgeFrom)
    }

    func weight(from source: Vertex, to destination: Vertex) -> Double? {
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

    func edges(from source: Vertex) -> [Edge]? {
        return adjacencyDict[source]
    }

    public func createVertex(data: CGPoint) -> Vertex {
        let vertex = Vertex(data: data)

        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }

        return vertex
    }


}
