import UIKit
import Foundation
import Darwin

public class Node<Value> {
    public var value: Value
    public var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> " + String(describing: next) + " "
    }
}

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
        
    init() {}
    
    var isEmpty: Bool {
        return head == nil
    }
    
    public mutating func push(value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(value: Value) {
        guard !isEmpty else {
            push(value: value)
            return
        }
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    public mutating func nodeAt(index : Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    public mutating func insertAfter(value: Value, node: Node<Value>) {
        if tail === node {
            append(value: node.value)
            return
        }
        
        node.next = Node(value: value, next: node.next)
    }
    
    public mutating func pop() {
        head = head?.next
        if isEmpty {
            tail = nil
        }
    }
    
    public mutating func removeLast() {
        guard let head = head else { return }
        guard head.next !== nil else {
            pop()
            return
        }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
    }
    
    //1 -> 2 -> 3
    
    public mutating func removeAfter(index node: Node<Value>) {
        guard node.next === tail else {
            removeLast()
            return
        }
        
        node.next = node.next?.next
    }
    
    public func mergeTwoList(list1: Node<Int>?, list2: Node<Int>?) -> Node<Int>? {
        if list1 == nil || list2 == nil {
            return list1?.value == nil ? list2 : list1
        }
        
        var startNode: Node<Int>?
        var endNode: Node<Int>?

        if (list1?.value ?? 0) < (list2?.value ?? 0) {
            startNode = list1
            endNode = mergeTwoList(list1: startNode?.next, list2: list2)
        } else {
            startNode = list2
            endNode = mergeTwoList(list1: list1, list2: startNode?.next)
        }
        
        startNode?.next = endNode
        
        return startNode
    }
    
    public func reverseLinkedList() -> Node<Value>? {
        var current = head
        var previous: Node<Value>?
        while current != nil {
            let temp = current?.next
            current?.next = previous
            previous = current
            current = temp
        }
        return previous
    }
}

// 1 -> 2 -> 3

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

var list = LinkedList<Int>()
list.append(value: 1)
list.append(value: 5)
list.append(value: 7)
list.push(value: 9)
//  print(list)


var lis2 = LinkedList<Int>()
lis2.append(value: 2)
lis2.append(value: 4)
lis2.append(value: 6)
lis2.push(value: 8)

//let node = lis2.reverseLinkedList()
//print("Reverse linked list \(node)")

var m1List = LinkedList<Int>()
m1List.append(value: 1)
m1List.append(value: 2)
m1List.append(value: 3)

var m2List = LinkedList<Int>()
m2List.append(value: 1)
m2List.append(value: 2)
m2List.append(value: 3)
m2List.append(value: 4)

let mergedNode = list.mergeTwoList(list1: m1List.head, list2: m2List.head)
debugPrint("mergedNode \(mergedNode)")
