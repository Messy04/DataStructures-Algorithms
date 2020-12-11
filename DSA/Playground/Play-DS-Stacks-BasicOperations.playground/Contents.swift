import Foundation

/* Data Structures - Stack - Basic Operations(Push, Pop) */
class Stack<T> {
    
    var MAX_CAPACITY: Int = 0
    var top: Int = -1
    var stack: [T?]
    
    let OverflowMessage: String = "Stack Overflow"
    let UnderflowMessage: String = "Stack Underflow"
    
    // Initialize the stack
    init(capacity: Int) {
        MAX_CAPACITY = capacity
        stack = []
    }
    
    // Push and element in the stack if there is space
    func push(_ value: T) {
        if top == MAX_CAPACITY-1 {
            print(OverflowMessage)
        } else {
            stack.append(value)
            top += 1
        }
    }
    
    // remove an element from top of  the stack if there are elemnts present in the stack
    func pop() {
        if top == -1 {
            print(OverflowMessage)
        } else {
            let topElement = stack[top]!
            stack[top] = nil
            top -= 1
            print("removed \(topElement) from stack")
        }
    }
    
    // Print the top element of the stack
    func getTopElement() {
        if top == -1 {
            print(UnderflowMessage)
        } else {
            print(stack[top] as Any)
        }
    }
    
    // Get count of total elements in the stack
    func getCount() {
        if top == -1 {
            print(UnderflowMessage)
        }  else {
            print(top+1)
        }
    }
    
    // Print stack elements
    func printElements() {
        if top == -1 {
            print(UnderflowMessage)
        } else {
            var i = top
            while i >= 0 {
                print("|\(stack[i]!)|")
                i -= 1
            }
        }
    }
}

let s1 = Stack<Int>(capacity: 5)
s1.push(1)
s1.push(2)
//s1.push("C")
//s1.push("D")
//s1.push("E")
//s1.push("X")

//s1.pop()

s1.printElements()
