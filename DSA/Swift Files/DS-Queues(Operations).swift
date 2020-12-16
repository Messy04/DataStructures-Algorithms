import Foundation

/* Data Structures - Queue - Basic Operations(Enqueue, Dequeue) */
class Queue<T> {
    
    var MAX_CAPACITY: Int = 0
    var first: Int = 0
    var last: Int = -1
    private var queue: [T?]
    
    // Initialize the queue
    init(capacity: Int) {
        MAX_CAPACITY = capacity
        queue = []
    }
    
    // Enqueue an element at end of queue if there is space
    func enqueue(_ value: T) {
        if last == MAX_CAPACITY-1 {
            print("Queue is full.")
        } else {
            queue.append(value)
            last += 1
        }
    }
    
    // Dequeue an element from beginning of the queue if there are elemnts present in the queue
    func dequeue() {
        if last == -1 {
            print("Queue is empty.")
        } else {
            let firstElement = queue[first]!
            queue[first] = nil
            first += 1
            print("removed \(firstElement) from queue")
        }
    }
    
    // Print the first element of the queue
    func getFirstElement() {
        if last == -1 {
            print("Queue is empty.")
        } else {
            print(queue[first] as Any)
        }
    }
    
    // Get count of total elements in the queue
    func getCount() {
        if last == -1 {
            print("Queue is empty.")
        }  else {
            print(last+1-first)
        }
    }
    
    // Print stack elements
    func printElements() {
        if last == -1 {
            print("Queue is empty.")
        } else {
            var i = first
            var text = ""
            while i <= last {
                text += "\(queue[i]!) "
                i += 1
            }
            print(text)
        }
    }
}

let s1 = Queue<Character>(capacity: 5)
s1.enqueue("A")
s1.enqueue("B")
s1.enqueue("C")
s1.enqueue("D")
s1.enqueue("E")


s1.dequeue()

s1.getCount()

s1.printElements()
