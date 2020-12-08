
/* Data Structure - Binary Search Tree(Basic Operations) */
import Foundation

class Node {
    
    let data: Int
    var leftChild: Node?
    var rightChild: Node?
    
    init(_ value: Int) {
        self.data = value
        self.leftChild = nil
        self.rightChild = nil
    }
    
    //MARK:- INSERT A NODE IN THE TREE
    func insert(value: Int) {
        if value <= data {
            if leftChild == nil {
                leftChild = Node(value)
            } else {
                leftChild?.insert(value: value)
            }
        } else {
            if rightChild == nil {
                rightChild = Node(value)
            } else {
                rightChild?.insert(value: value)
            }
        }
    }
    
    //MARK:- SEARCH FOR A GIVEN NODE WITH ITS DATA
    func contains(value: Int) {
        var found = false
        
        if value == data {
            print("data found: ",value)
            found = true
            return
        }else if value <= data {
            if leftChild == nil {
                print("Oops!, It seems value is not in the tree.")
                return
            } else {
                leftChild?.contains(value: value)
            }
        } else {
            if rightChild == nil {
                print("Oops!, It seems value is not in the tree.")
                return
            } else {
                rightChild?.contains(value: value)
            }
        }
    }
    
    //MARK:- PRINT ELEMENTS OF THE TREE
    func printInOrder() {
        var text = ""
        if leftChild != nil {
            leftChild?.printInOrder()
        }
        print(data)
        if rightChild != nil {
            rightChild?.printInOrder()
        }
    }
}

//MARK: CLASS IMPLEMENTATION OF A BINARY SEARCH TREE PERFORMING BASIC OPERATIONS
class BST {
    
    var rootNode: Node?
    
    func insert(value: Int) {
        if rootNode == nil {
            rootNode = Node(value)
            return
        } else {
            rootNode?.insert(value: value)
        }
    }
    
    func search(key: Int) {
        if rootNode == nil {
            print("No nodes are there in the tree.")
            return
        } else {
            rootNode?.contains(value: key)
        }
    }
    
    func printTree() {
        if rootNode == nil {
            print("No nodes are there in the tree.")
            return
        } else {
            rootNode?.printInOrder()
        }
    }
}

let bst = BST()
bst.insert(value: 10)
bst.insert(value: 5)
bst.insert(value: 15)
bst.insert(value: 8)
bst.insert(value: 50)

bst.printTree()
