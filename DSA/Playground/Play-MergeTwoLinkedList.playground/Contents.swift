import Foundation
import UIKit

/* Data Structure - Singly Linked List(Append, Prepend, Insert @ a position, Delete) */

//MARK:- A NODE CLASS HAVING A VALUE AND ADDRESS OF THE NEXT NODE
class Node<T> {
    var value: T
    var nextNode: Node?

    init(value: T) {
        self.value = value
        self.nextNode = nil
    }
}

//MARK:- A CLASS TO PERFORM BASIC OPERATIONS ON LINKED LIST
class LinkedList<T> {

    var headNode: Node<T>?
    
    init() {
        headNode = nil
    }
    
    //ADD A NODE IN THE END OF A LIST
    func append(value: T) {
        if headNode == nil {
            let node = Node(value: value)
            headNode = node
        } else if headNode?.nextNode == nil {
            let node = Node(value: value)
            headNode?.nextNode = node
        } else {
            var currentNode = headNode
            while currentNode?.nextNode != nil {
            currentNode = currentNode?.nextNode
                if currentNode?.nextNode == nil {
                    let newNode = Node(value: value)
                    currentNode?.nextNode = newNode
                    break
                }
            }
        }
    }
    
    //ADD A NODE IN THE START OF A LIST
    func prepend(value: T) {
        let newNode = Node(value: value)
        newNode.nextNode = headNode
        headNode = newNode
    }
    
    //ADD A NODE AT GIVEN INDEX IN A LIST
    func insert(value: T, at index: Int) {
        if index == 0 {
            prepend(value: value)
        } else if index == numberOfNodes() {
            append(value: value)
        } else if index > numberOfNodes() || index < 0 {
            print("index out of bounds")
        } else {
            var count = 0
            var currentNode = headNode
            while count < index {
                count = count + 1
                if index == count {
                    let newNode = Node(value: value)
                    let nextNode = currentNode?.nextNode
                    currentNode?.nextNode = newNode
                    newNode.nextNode = nextNode
                    break
                }
                currentNode = currentNode?.nextNode
            }
        }
    }
    
    //DELETE A NODE AT GIVEN INDEX IN A LIST
    func deleteNode(at index: Int) {
        
        if index == 0 {
            var currentNode = headNode
            headNode = currentNode?.nextNode
            currentNode = nil
        } else if index >= numberOfNodes() || index < 0 {
            print("index out of bounds")
        } else {
            var count = 0
            var currentNode = headNode
            while count < index {
                count += 1
                if index == count {
                    var nextNode = currentNode?.nextNode
                    let nextNodeAfterDelete = nextNode?.nextNode
                    currentNode?.nextNode = nextNodeAfterDelete
                    nextNode = nil
                    break
                }
                currentNode = currentNode?.nextNode
            }
        }
    }
    
    //PRINT ELEMENTS OF LINKED LIST
    func printList() {
        if headNode == nil {
            print("List is empty")
        } else if headNode?.nextNode == nil {
            print(headNode!.value)
        } else {
            var currentNode = headNode
            var text = "\(currentNode!.value)->"
            while currentNode?.nextNode != nil {
                currentNode = currentNode?.nextNode
                text = text+"\(currentNode!.value)->"
            }
            
            text += "NULL"
            print(text)
        }
    }
    
    //COUNT NUMBER OF NODES IN A LIST
    func numberOfNodes() -> Int{
       
        if headNode == nil {
            return 0
        } else if headNode?.nextNode == nil {
            return 1
        } else {
            var count = 0
            var currentNode = headNode
            while currentNode != nil {
                count = count + 1
                currentNode = currentNode?.nextNode
            }
            return count
        }
    }
}

//MARK:- A CLASS TO DEMONSTRATE APPLICATIONS OF A LINKED LIST
class LinkedListApplication {
    
    
    func mergeList(_ l1: LinkedList<Int>, _ l2: LinkedList<Int>) {
        
        var currentNode = l1.headNode
        while currentNode?.nextNode != nil {
            currentNode = currentNode?.nextNode
        }
        
        currentNode?.nextNode = l2.headNode
    }
    
    func isIntersecting() {
        
    }
}

let l1 = LinkedList<Int>()
for i in 1...5 {
    l1.append(value: i)
}

let l2 = LinkedList<Int>()
var count = 10
while count <= 30 {
    l2.append(value: count)
    count += 5
}

let l3 = LinkedList<Int>()
count = 3
while count <= 24 {
    l3.append(value: count)
    count += 3
}

print("Before Merge")
l1.printList()
l2.printList()
l3.printList()

print("\nAfter Merge")
LinkedListApplication().mergeList(l1, l2)
LinkedListApplication().mergeList(l3, l2)
l1.printList()
l3.printList()
