import UIKit

/* Implementing Stacks using Linked Lists */

// MARK:- Node Class

/// A Node class representing a single node in a Linked List
/// - Author: Rishab Kumar
class Node<T> {
    let data: T
    var next: Node?
    
    /// Initialize the node with provided value
    /// - Parameter value: Integer value as the value of the node
    init(_ value: T) {
        self.data = value
        self.next = nil
    }
}

// MARK:- Linked List Class

/// A Linked List class Encapsulating various Linked List operations
/// - Author: Rishab Kumar
class LinkedList<T> {
    private var headNode: Node<T>?
    
    /// Get the Head Node of the Linked List
    /// - Returns: Head Node of the list
    func getHead() -> Node<T>? {
        return headNode
    }
    
    /// Add a new value at the end of the List
    /// - Parameter value: An integer value as data of a Node
    func append(_ value: T) {
        let newNode = Node(value)
        if let _ = headNode {
            var currentNode = headNode
            // traverse the list to the last (until next is found to be null)
            while currentNode?.next != nil {
                currentNode = currentNode?.next
            }
            // when we reach at the last node add the newly created node
            currentNode?.next = newNode
        } else {
            // there are no nodes present in the list
            headNode = newNode
        }
    }
    
    /// Add a new value at the start of the List
    /// - Parameter value: An integer value as data of a Node
    func prepend(_ value: T) {
        let newNode = Node(value)
        if let _ = headNode {
            newNode.next = headNode // add new node before the head node
            headNode = newNode // update the head node to newly created node
        } else {
            // there are no nodes present in the list
            headNode = newNode
        }
    }
    
    /// Get the count of node in the list
    /// - Returns: Count of number of nodes in the list
    func nodeCount() -> Int {
        if let _ = headNode {
            var currentNode = headNode
            var count = 0
            // traverse the list to the last (until next is found to be null)
            while currentNode?.next != nil {
                count += 1
                currentNode = currentNode?.next
            }
            // when we reach at the last node, increment count(since, last node is not counted in the loop) and return its value
            return count + 1
        } else {
            // there are no nodes present in the list
            return 0
        }
    }
    
    /// Print all the elements in the list
    func printNodes() {
        if let _ = headNode {
            var currentNode = headNode
            var text = ""
            // traverse the list to the last (until next is found to be null)
            while currentNode?.next != nil {
                text += "\(currentNode!.data as T) -> "
                currentNode = currentNode?.next
            }
            // when we reach at the last node, append the last nodes value to the text string and print
            text += "\(currentNode!.data as T) -> NULL"
            print(text)
        } else {
            // there are no nodes present in the list
            print("No elements in the list")
        }
    }
}

// MARK:- Extending Linked List class to Update the head pointer
extension LinkedList {
    
    /// Update Head pointer to the next element in the list
    func updateHead() {
        let currentHead = headNode
        headNode = currentHead?.next
    }
}

// MARK:- Stack Class

/// A Stack class Encapsulating various Stacks operations
/// - Author: Rishab Kumar
class Stack<T> {
    
    private var stackList: LinkedList<T>
    private var topIndex: Int
    private let noElementsFound = "No elements are in the Stack."
    
    /// Initialize Stack variable with default stored properties
    init() {
        stackList = LinkedList<T>()
        topIndex = -1
    }
    
    /// Get the top element in the Stack
    var topElement: String {
        if let head = stackList.getHead() {
            return "\(head.data)"
        } else {
            print(noElementsFound)
            return ""
        }
    }
    
    /// Push a new element in the Stack List
    /// - Parameter value: value that needs to be added
    func push(_ value: T) {
        stackList.prepend(value)
        topIndex += 1
    }
    
    /// Pop the last element entered in the Stack
    /// - Returns: The popped value
    func pop() -> T? {
        if topIndex == -1 {
            print(noElementsFound+" Can't pop Elements any further")
            return nil
        } else {
            let oldHead = stackList.getHead()?.data
            stackList.updateHead() // remove the top element in the stack
            topIndex -= 1
            return oldHead
        }
    }
    
    /// Get number of elements in the stack
    func getElementsCount() {
        print(topIndex + 1)
    }
    
    /// Print all the elements in the stack
    func printElements() {
        stackList.printNodes()
    }
}

// MARK:- Driver Program
let stack = Stack<Int>()

stack.push(50)
stack.push(52)
stack.push(57)
stack.push(59)

stack.pop()
stack.pop()

stack.topElement
stack.getElementsCount()
stack.printElements()
