import Foundation


/* Algorithm - Sorting Algorithm - Insertion Sort */

func insertionSort(arr: [Int]) -> [Int]{
    
    var a = arr
    
    for i in 1..<a.count {
        let key = a[i]
        var j = i-1
        while j >= 0 && key < a[j] {
            a[j+1] = a[j]
            j -= 1
        }
        a[j+1] = key
    }
    
    return a
}

print(insertionSort(arr: [5,9,1,4,2]))
