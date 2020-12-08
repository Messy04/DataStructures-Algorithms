import UIKit

//MARK:- A CLASS IMPLEMENTATION OF A NODE
class Node {
    
    var data: Int
    var left: Node?
    var right: Node?
    
    init(_ value: Int) {
        self.data = value
        self.left = nil
        self.right = nil
    }
    
    // insert a node recursively
    func insert(_ value: Int) {
        if value < data {
            if left == nil {
                left = Node(value)
            } else {
                left?.insert(value)
            }
        } else {
            if right == nil {
                right = Node(value)
            } else {
                right?.insert(value)
            }
        }
    }
    
    // search for a node with a key recursively
    func search(_ key: Int) {
        if key == data {
            print("Key: \(data) exists in the tree")
            return
        } else if key < data {
            if left == nil {
                print("Key not found")
                return
            } else {
                left?.search(key)
            }
        } else {
            if right == nil {
                print("Key not found")
                return
            } else {
                right?.search(key)
            }
        }
    }
    
    //In-Order traversal of a tree
    func printInOrder() {
        if left != nil {
            left?.printInOrder()
        }
        print(data)
        if right != nil {
            right?.printInOrder()
        }
        
    }
}

//MARK:- A CLASS IMPLEMENTING OPERATIONS FOR BINARY SEARCH TREE
class BST {
    
    var rootNode: Node?
    
    //insert a value in the tree
    func insert(_ value: Int) {
        if rootNode == nil {
            rootNode = Node(value)
        } else {
            rootNode?.insert(value)
        }
    }
    
    //search a value in the tree with a specific key
    func search(_ key: Int) {
        if rootNode == nil {
            print("No nodes in tree.")
            return
        } else {
            rootNode?.search(key)
        }
    }
    
    //get node with minimum value in the tree(Iterative)
    func getMinNode() -> Node? {
        if rootNode == nil {
            return nil
        } else if rootNode?.left == nil {
            return rootNode!
        } else {
            var current = rootNode
            while current?.left != nil {
                current = current?.left
            }
            return current!
        }
    }

    //get node with max value in the tree(Recursive)
    func getMaxNode(root: Node?) -> Node? {
        if root == nil {
            return nil
        } else if root?.right == nil {
            return root!
        } else {
            return getMaxNode(root: root?.right)
        }
    }
    
    //get minimum value in the tree(Iterative)
    func getMin() -> Int {
        if rootNode == nil {
            return -1
        } else if rootNode?.left == nil {
            return rootNode!.data
        } else {
            var current = rootNode
            while current?.left != nil {
                current = current?.left
            }
            return current!.data
        }
    }

    //get max value in the tree(Recursive)
    func getMax(root: Node?) -> Int {
        if root == nil {
            return -1
        } else if root?.right == nil {
            return root!.data
        } else {
            return getMax(root: root?.right)
        }
    }
    
    //get the height of the tree from root
    func height(root: Node?) -> Int {
        if root == nil {
            return -1
        } else {
            return max(height(root: root?.left), height(root: root?.right)) + 1
        }
    }
    
    //print all the nodes in the tree
    func printNodes() {
        rootNode?.printInOrder()
    }
    
    //level order traversal of a tree
    func levelOrderTraversal() {
        /* STEPS */
        // Initialize a queue
        // Enqueue a discovered node in the queue
        // Visit the discovered node and enqueue its children if there are.
        // Dequeue the discovered node and repeat the process untill queue is empty
    }
    
    //check if its a BST or not
    func isBST(root: Node?, data: Int) -> Bool {
        if rootNode == nil {
            return false
        } else if rootNode?.left == nil && rootNode?.right == nil {
            return true
        } else {
            
            return true
        }
    }
}

//MARK:- DRIVER PROGRAM
let tree = BST()
//tree.insert(5)
//tree.insert(10)
//tree.insert(7)
//tree.insert(24)
//tree.insert(3)
//tree.insert(4)
//tree.insert(1)

//tree.printNodes()

// L0
tree.rootNode = Node(10)
tree.rootNode?.left = Node(5)
tree.rootNode?.right = Node(20)

// L1
tree.rootNode?.left?.left = Node(4)
tree.rootNode?.left?.right = Node(6)
tree.rootNode?.right?.left = Node(12)
tree.rootNode?.right?.right = Node(21)

tree.printNodes()
tree.isBST(root: tree.rootNode, data: 10)
