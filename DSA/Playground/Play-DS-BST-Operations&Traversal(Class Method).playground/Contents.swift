import UIKit

// MARK:- Node class for a Binary Search Tree Implementation
class Node<T: Comparable> {
    var data: T
    var left: Node<T>?
    var right: Node<T>?
    
    /// Initializer function for a Node type object
    /// - Parameter data: Value of the Node
    init(data: T) {
        self.data = data
        self.left = nil
        self.right = nil
    }
}

// MARK:- Binary Search Tree Operations and Implementation
class BinarySearchTree<T: Comparable> {
    private var root: Node<T>?
    private let emptyTreeMessage = "Tree has no Nodes"
    
    // MARK: Binary Search Tree Properties
    
    /// Get Root Node of the BST
    /// - Returns Node<T>?: An optional Node object
    var rootNode: Node<T>? {
        return root
    }
    
    /// Get Node with the maximum value in the BST
    /// - Returns Node<T>?: An optional Node object
    var maxNode: Node<T>? {
        if root == nil {
            print(emptyTreeMessage)
            return nil
        } else {
            var currentNode = root
            while currentNode?.right != nil {
                currentNode = currentNode?.right
            }
            return currentNode
        }
    }
    
    /// Get Node with the minimum value in the BST
    /// - Returns Node<T>?: An optional Node object
    var minNode: Node<T>? {
        if root == nil {
            print(emptyTreeMessage)
            return nil
        } else {
            var currentNode = root
            while currentNode?.left != nil {
                currentNode = currentNode?.left
            }
            return currentNode
        }
    }
    
    // MARK: Binary Search sTree Operation
    
    /// Insert a Node in the BST
    /// - Parameters:
    ///   - node: Node to which the value is to be inserted
    ///   - value: Value of the newly created Node
    func insert(node: Node<T>?, value: T) {
        if self.root == nil {
            self.root = Node(data: value)
        }
        
        if let _ = node {
            if value < node!.data {
                // insert in the left sub-tree
                if node?.left != nil {
                    insert(node: node?.left, value: value)
                } else {
                    // create a new left node
                    node?.left = Node(data: value)
                }
            } else {
                // insert in the right sub-tree
                if node?.right != nil {
                    insert(node: node?.right, value: value)
                } else {
                    // create a new right node
                    node?.right = Node(data: value)
                }
            }
        }
    }
    
    /// Search for a key inside the BST
    /// - Parameters:
    ///   - node: Node to which the key is to be searched
    ///   - key: Key which is to be searched in the BST
    /// - Returns: A boolean value weather key found in the BST or not
    func search(node: Node<T>?, key: T) -> Bool {
        var found = false
        if root == nil {
            print(emptyTreeMessage)
        } else {
            if let _ = node {
                if key > node!.data {
                    found = search(node: node?.right, key: key)
                    return found
                } else if key < node!.data {
                    found = search(node: node?.left, key: key)
                    return found
                } else if key == node!.data {
                    found = true
                    return found
                }
            }
        }
        return false
    }
    
    // MARK: Binary Search Tree Traversal
    
    /// Traversing pre order root, left, right
    /// - Parameter node: Root node of the subtree to be traversed
    func preorder(node: Node<T>?) {
        if let _ = node {
            print(node!.data)
            preorder(node: node?.left)
            preorder(node: node?.right)
        }
    }
    
    /// Traversing in order left, root, right
    /// - Parameter node: Root node of the subtree to be traversed
    func inorder(node: Node<T>?) {
        if let _ = node {
            inorder(node: node?.left)
            print(node!.data)
            inorder(node: node?.right)
        }
    }
    
    /// Traversing post order left, right, root
    /// - Parameter node: Root node of the subtree to be traversed
    func postorder(node: Node<T>?) {
        if let _ = node {
            postorder(node: node?.left)
            postorder(node: node?.right)
            print(node!.data)
        }
    }
}

// MARK:- Driver Program
let bst = BinarySearchTree<Int>()

bst.insert(node: bst.rootNode, value: 10)
bst.insert(node: bst.rootNode, value: 5)
bst.insert(node: bst.rootNode, value: 12)
bst.insert(node: bst.rootNode, value: 4)
bst.insert(node: bst.rootNode, value: 9)
bst.insert(node: bst.rootNode, value: 11)
bst.insert(node: bst.rootNode, value: 15)

bst.maxNode?.data
bst.minNode?.data

bst.search(node: bst.rootNode, key: 90)
bst.postorder(node: bst.rootNode)
