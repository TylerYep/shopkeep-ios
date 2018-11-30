//
//  Queue.swift
//  ShopKeep
//
//  Created by Adam Halper on 11/29/18.
//  Copyright © 2018 Alex Fu. All rights reserved.
//

import Foundation

public struct Queue<T> {

    // 2
    fileprivate var list = LinkedList<T>()

    public var isEmpty: Bool {
        return list.isEmpty
    }

    // 3
    public mutating func enqueue(_ element: T) {
        list.append(value: element)
    }

    // 4
    public mutating func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else { return nil }

        list.remove(node: element)

        return element.value
    }

    // 5
    public func peek() -> T? {
        return list.first?.value
    }
}


public class Node<T> {
    var value: T
    var next: Node<T>?
    weak var previous: Node<T>?

    init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    fileprivate var head: Node<T>?
    private var tail: Node<T>?

    public var isEmpty: Bool {
        return head == nil
    }

    public var first: Node<T>? {
        return head
    }

    public var last: Node<T>? {
        return tail
    }

    public func append(value: T) {
        let newNode = Node(value: value)
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }

    public func nodeAt(index: Int) -> Node<T>? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }

    public func removeAll() {
        head = nil
        tail = nil
    }

    public func remove(node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next

        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev

        if next == nil {
            tail = prev
        }

        node.previous = nil
        node.next = nil

        return node.value
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head

        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }
}

