/* Implementation of Heap Data Structure */

// MARK:- /* Heap class with sort and heapify */
class Heap {
    
    private var array: [Int]
    private var size: Int
    
    init(array: [Int]) {
        self.array = array
        self.size = array.count
    }
    
    func sort() {
        
    }
     
    private func heapify() {
          
    }
}

// MARK:- /* DRIVER PROGRAM */
let array = [5,2,1,7,4,6,3]

let heap = Heap(array: array)
heap.sort()
