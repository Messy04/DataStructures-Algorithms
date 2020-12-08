import Foundation

/* Data Structure - Singly Linked List(Append, Prepend, Insert @ a position, Delete) */

class Node<T> {
    var value: T
    var nextNode: Node?

    init(value: T) {
        self.value = value
        self.nextNode = nil
    }
}

class LinkedList<T> {

    var headNode: Node<T>?
	
	init() {
		headNode = nil
	}
	
    //MARK:- ADD A NODE IN THE END OF A LIST
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
    
    //MARK:- ADD A NODE IN THE START OF A LIST
    func prepend(value: T) {
        let newNode = Node(value: value)
        newNode.nextNode = headNode
        headNode = newNode
    }
    
    //MARK:- ADD A NODE AT GIVEN INDEX IN A LIST
    func insert(value: T, at index: Int) {
    	if index == 0 {
    		prepend(value: value)
    	} else if index == countNodes() {
    		append(value: value)
    	} else if index > countNodes() || index < 0 {
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
    
    func deleteNode(at index: Int) {
    	
    	if index == 0 {
    		var currentNode = headNode
    		headNode = currentNode?.nextNode
    		currentNode = nil
    	} else if index >= countNodes() || index < 0 {
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

    func countNodes() -> Int{
       
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

let l1 = LinkedList<Character>()
l1.prepend(value: "A")
l1.prepend(value: "B")
l1.prepend(value: "C")
l1.prepend(value: "D")
l1.prepend(value: "F")
l1.insert(value: "E", at: 1)
l1.deleteNode(at: 5)

l1.printList()
print(l1.countNodes())
