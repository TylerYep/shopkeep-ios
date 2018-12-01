//
//  Graphable.swift
//  ShopKeep
//
//  Created by Adam Halper on 11/29/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import UIKit

protocol Graphable {
    //var description: CustomStringConvertible { get } // 2

    func createVertex(data: CGPoint) -> Vertex // 3
    func add(from source: Vertex, to destination: Vertex, weight: Double?) // 4
    func weight(from source: Vertex, to destination: Vertex) -> Double? // 5
    func edges(from source: Vertex) -> [Edge]? // 6
}

extension Graphable {
    public func breadthFirstSearch(from source: Vertex, to destination: Vertex) -> [Edge]? {
        var queue = Queue<Vertex>()
        queue.enqueue(source)
        var visits : [Vertex : Visit] = [source: .source] // 1

        while let visitedVertex = queue.dequeue() {
            if visitedVertex == destination {
                var vertex = destination // 1
                var route: [Edge] = [] // 2

                while let visit = visits[vertex],
                    case .edge(let edge) = visit { // 3

                        route = [edge] + route
                        vertex = edge.source // 4

                }
                return route // 5
            }
            let neighbourEdges = edges(from: visitedVertex) ?? []
            for edge in neighbourEdges {
                if visits[edge.destination] == nil { // 2
                    queue.enqueue(edge.destination)
                    visits[edge.destination] = .edge(edge) // 3
                }
            }
        }
        return nil
    }
}

enum Visit {
    case source
    case edge(Edge)
}

public struct Visitx {
    var source: Vertex
    var edge: Edge
}


/*
 public func breadthFirstSearch(from source: Vertex, to destination: Vertex) -> [Edge]? {
 var queue = Queue<Vertex>()
 queue.enqueue(source)
 var visits : [Vertex : Visit] = [source: .source] // 1

 while let visitedVertex = queue.dequeue() {
 if visitedVertex == destination {
 var vertex = destination // 1
 var route: [Edge] = [] // 2

 while let visit = visits[vertex],
 case .edge(let edge) = visit { // 3

 route = [edge] + route
 vertex = edge.source // 4

 }
 return route // 5
 }
 let neighbourEdges = edges(from: visitedVertex) ?? []
 for edge in neighbourEdges {
 if visits[edge.destination] == nil { // 2
 queue.enqueue(edge.destination)
 visits[edge.destination] = .edge(edge) // 3
 }
 }
 }
 return nil
 }

 */
