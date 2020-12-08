import UIKit

/* Implement Different Types of Linked List and Operations on a Linked List */

// MARK:- Linked List Protocol

/// Protocol for Linked List with common operations on Linked List
/// - Author: Rishab Kumar
protocol LinkedList {
    associatedtype LinkedListType
    func getHeadNode() -> Node<LinkedListType>?
    func append(_ value: LinkedListType)
    func prepend(_ value: LinkedListType)
    func insertNode(at index: Int, value: LinkedListType)
}

// MARK:- Linked List Operation Protocol

/// Protocol for Linked List associated Operations
/// - Author: Rishab Kumar
protocol LinkedListOperationDelegate {
    associatedtype LinkedListType
    func nodeCount() -> Int
    func printNodes()
    func deleteNode(at index: Int) -> Node<LinkedListType>?
    func reverseList()
    func sortList()
    func search(key: LinkedListType)
}

// MARK:- Node Class

/// A Node class Encapsulating various Node properties
/// - Author: Rishab Kumar
class Node<T> {
    let data: T
    var next: Node<T>?
    var previous: Node<T>?
    
    init(_ value: T) {
        data = value
        next = nil
        previous = nil
    }
}

// MARK:- Singly Linked List Class

/// A Singly Linked List class Encapsulating various Linked List operations
/// - Author: Rishab Kumar
class SinglyLinkedList<T: Equatable>: LinkedList, LinkedListOperationDelegate {
    
    typealias LinkedListType = T
    private var headNode: Node<LinkedListType>?
    private var tailNode: Node<LinkedListType>?
    private var numberOfNodes: Int = 0
    
    // MARK: Linked List Implementation
    
    /// Get the Head Node of the Linked List
    /// - Returns: Head Node of the list
    func getHeadNode() -> Node<T>? {
        return headNode
    }
    
    /// Get the Tail Node of the Linked List
    /// - Returns: Tail Node of the list
    func getTailNode() -> Node<T>? {
        return tailNode
    }
    
    /// Add a new value at the end of the List
    /// - Parameter value: An integer value as data of a Node
    func append(_ value: LinkedListType) {
        let newNode = Node(value)
        if let _ = headNode {
            var currentNode = headNode
            // traverse the list to the last (until next is found to be null)
            while currentNode?.next != nil {
                currentNode = currentNode?.next
            }
            // when we reach at the last node add the newly created node
            currentNode?.next = newNode
            tailNode = newNode // update the tail node as newly added node
        } else {
            // there are no nodes present in the list
            headNode = newNode
            tailNode = newNode
        }
        numberOfNodes += 1
    }
    
    /// Add a new value at the start of the List
    /// - Parameter value: An integer value as data of a Node
    func prepend(_ value: LinkedListType) {
        let newNode = Node(value)
        if let _ = headNode {
            newNode.next = headNode // add new node before the head node
            headNode = newNode // update the head node to newly created node
        } else {
            // there are no nodes present in the list
            headNode = newNode
            tailNode = newNode
        }
        numberOfNodes += 1
    }
    
    /// Add a node at a particular index in the Linked List (Assuming 0 based index)
    /// - Parameter index: index at which the node is to be inserted
    /// - Parameter value: Value of the node to be added
    func insertNode(at index: Int, value: LinkedListType) {
        // Check the corner cases
        if index < 0 || index > nodeCount() {
            print("Index can't be less than 0 or greater than \(nodeCount())")
            return
        }
        
        // Insert node based on the index provided
        if index == 0 {
            prepend(value)
        } else if index == nodeCount() {
            append(value)
        } else {
            // traverse to the particular index and insert the node
            var count = 0
            var currentNode = headNode
            while currentNode?.next != nil {
                count += 1
                if count == index {
                    let newNode = Node(value)
                    let nextNode = currentNode?.next
                    currentNode?.next = newNode
                    newNode.next = nextNode
                    break
                }
                currentNode = currentNode?.next
            }
            numberOfNodes += 1
        }
    }
    
    // MARK: Linked List Operations Delegate Implementation
    
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
                text += "\(currentNode!.data as LinkedListType) -> "
                currentNode = currentNode?.next
            }
            // when we reach at the last node, append the last nodes value to the text string and print
            text += "\(currentNode!.data as LinkedListType) -> NULL"
            print(text)
        } else {
            // there are no nodes present in the list
            print("No elements in the list")
        }
    }
    
    /// Delete a node at any particular index from the list
    /// - Parameter index: index at which the node is to be deleted
    /// - Returns: Deleted Node Object
    func deleteNode(at index: Int) -> Node<LinkedListType>? {
        // check corner case
        if index < 0 || index > nodeCount() {
            print("Index can't be less than 0 or greater than \(nodeCount())")
            return nil
        }
        
        if index == 0 {
            // remove head node
            let currentHead = headNode
            headNode = currentHead?.next
            return currentHead
        } else if index == nodeCount() {
            // remove tail node
            var currentNode = headNode
            while currentNode != nil {
                currentNode = currentNode?.next
            }
            let deletedNode = currentNode
            currentNode = nil
            return deletedNode
        } else {
            var currentNode = headNode
            var count = 0
            while currentNode?.next != nil {
                count += 1
                if count == index {
                    let nodeToDelete = currentNode?.next
                    currentNode?.next = nodeToDelete?.next
                    return nodeToDelete
                }
                currentNode = currentNode?.next
            }
        }
        return nil
    }
    
    /// Reverse the Elements in the list
    func reverseList() {
        //
    }
    
    /// Sort the elements in the list
    func sortList() {
        //
    }
    
    /// Search for a particular key in the list
    /// - Parameter key: Key to be searched in the list
    func search(key: LinkedListType) {
        var currentNode = headNode
        var count = 0

        while currentNode?.next != nil {
            if currentNode?.data == key {
                print("key \(key) found at position \(count)")
                return
            }
            count += 1
            currentNode = currentNode?.next
        }
        
        if currentNode?.data == key {
            // check key for last node
            print("key \(key) found at position \(count)")
            return
        } else {
            // if key is not found
            print("key \(key) not found in the list")
        }
    }
}

// MARK:- Doubly Linked List Class

/// A Singly Linked List class Encapsulating various Linked List operations
/// - Author: Rishab Kumar
class DoublyLinkedList<T: Equatable>: LinkedList, LinkedListOperationDelegate {
    
    typealias LinkedListType = T
    private var headNode: Node<LinkedListType>?
    private var tailNode: Node<LinkedListType>?
    private var numberOfNodes: Int = 0
    
    // MARK: Linked List Implementation
    
    /// Get head node of the list
    /// - Returns: The Head Node
    func getHeadNode() -> Node<LinkedListType>? {
        return headNode
    }
    
    /// Get tail node(last) of the list
    /// - Returns: The Head Node
    func getTailNode() -> Node<LinkedListType>? {
        return tailNode
    }
    
    /// Add a node at end of the list
    /// - Parameter value: Value of the node to be added
    func append(_ value: LinkedListType) {
        let newNode = Node(value)
        if let _ = headNode {
            var currentNode = headNode
            while currentNode?.next != nil {
                currentNode = currentNode?.next
            }
            // reached end of the list
            currentNode?.next = newNode // the next pointer of the last node points to the new node
            newNode.previous = currentNode // previous pointer of the newly added node points to the last node
            tailNode = newNode // update the tail node once new node is attached to the list
        } else {
            // no nodes are present in the list
            headNode = newNode
            tailNode = newNode
        }
        numberOfNodes += 1 // increment node count after a new node is added to the list
    }
    
    /// Add a node at start of the list
    /// - Parameter value: Value of the node to be added
    func prepend(_ value: LinkedListType) {
        let newNode = Node(value)
        if let _ = headNode {
            headNode?.previous = newNode // current head's previous points to newly added node.
            newNode.next = headNode // new nodes next points to current head node
            headNode = newNode // update the head node
        } else {
            // no nodes are present in the list
            headNode = newNode
            tailNode = newNode
        }
        numberOfNodes += 1 // increment node count after a new node is added to the list
    }
    
    /// Add a node at a given index in the list
    /// - Parameters:
    ///   - index: Index(Int) at which the the node is to be added
    ///   - value: Value of the node to be added
    func insertNode(at index: Int, value: LinkedListType) {
        // check for corner cases
        if index < 0 || index > nodeCount() {
            print("Index can't be less than 0 or greater than \(nodeCount())")
            return
        }
        
        // insert node at the given index, assuming 0 based index
        let newNode = Node(value)
        if index == 0 {
            prepend(value)
        } else if index == nodeCount() {
            append(value)
        } else {
            var count = 0
            var currentNode = headNode
            while currentNode?.next != nil {
                count += 1
                if count == index {
                    let nodeAfterNewNode = currentNode?.next
                    currentNode?.next = newNode
                    newNode.previous = currentNode
                    newNode.next = nodeAfterNewNode
                    nodeAfterNewNode?.previous = newNode
                    break
                }
                currentNode = currentNode?.next
            }
            numberOfNodes += 1 // increment node count after a new node is added to the list
        }
    }
    
    /// Print the values of all elements of the list in reverse order
    func printReversedNodes() {
        if let _ = tailNode {
            var currentNode = tailNode
            var text = ""
            // traverse the list to the last (until next is found to be null)
            while currentNode?.previous != nil {
                text += "\(currentNode!.data as LinkedListType) -> "
                currentNode = currentNode?.previous
            }
            // when we reach at the last node, append the last nodes value to the text string and print
            text += "\(currentNode!.data as LinkedListType) -> NULL"
            print(text)
        } else {
            // there are no nodes present in the list
            print("No elements in the list")
        }
    }
    
    // MARK: Linked List Operations Delegate Implementation
    
    /// Print the values of all elements in the list
    func printNodes() {
        if let _ = headNode {
            var currentNode = headNode
            var text = ""
            // traverse the list to the last (until next is found to be null)
            while currentNode?.next != nil {
                text += "\(currentNode!.data as LinkedListType) -> "
                currentNode = currentNode?.next
            }
            // when we reach at the last node, append the last nodes value to the text string and print
            text += "\(currentNode!.data as LinkedListType) -> NULL"
            print(text)
        } else {
            // there are no nodes present in the list
            print("No elements in the list")
        }
    }
    
    /// Get count of number of nodes in the list
    /// - Returns: Count of nodes in the list
    func nodeCount() -> Int {
        return numberOfNodes
    }
    
    /// Delete a node at any particular index from the list
    /// - Parameter index: index at which the node is to be deleted
    /// - Returns: Deleted Node Object
    func deleteNode(at index: Int) -> Node<LinkedListType>? {
        return nil
    }
    
    /// Reverse the Elements in the list
    func reverseList() {
        //
    }
    
    /// Sort the elements in the list
    func sortList() {
        //
    }
    
    /// Search for a particular key in the list
    /// - Parameter key: Key to be searched in the list
    func search(key: LinkedListType) {
        var currentNode = headNode
        var count = 0

        while currentNode?.next != nil {
            if currentNode?.data == key {
                print("key \(key) found at position \(count)")
                return
            }
            count += 1
            currentNode = currentNode?.next
        }
        
        if currentNode?.data == key {
            // check key for last node
            print("key \(key) found at position \(count)")
            return
        } else {
            // if key is not found
            print("key \(key) not found in the list")
        }
    }
}

// MARK:- Driver Program

let list1 = SinglyLinkedList<Int>()
list1.append(1)
list1.append(2)
list1.append(3)
list1.append(4)
list1.append(5)
list1.insertNode(at: 2, value: 10)
list1.insertNode(at: 6, value: 100)
list1.insertNode(at: 0, value: 90)

list1.getHeadNode()?.data
list1.getTailNode()?.data

list1.search(key: 100)
list1.deleteNode(at: 3)?.data
list1.deleteNode(at: -1)?.data
list1.printNodes()

//let list2 = DoublyLinkedList<Int>()
//list2.append(5)
//list2.prepend(2)
//list2.insertNode(at: 1, value: 3)
//list2.append(10)


