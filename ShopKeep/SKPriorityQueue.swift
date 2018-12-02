//
//  SKPriorityQueue.swift
//  ShopKeep
//
//  Created by Adam Halper on 12/1/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import Foundation

public struct PriorityQueue<T> {
    fileprivate var heap: Heap<T>

    public init(sort: @escaping (T, T) -> Bool) {
        heap = Heap(priorityFunction: sort)
    }

    public var isEmpty : Bool {
        return heap.isEmpty
    }

    public var count : Int {
        return heap.count
    }

    public func peek() -> T? {
        return heap.peek()
    }

    public mutating func enqueue(_ element: T) {
        heap.enqueue(element)
    }

    public mutating func dequeue() -> T? {
        return heap.dequeue()
    }
}
