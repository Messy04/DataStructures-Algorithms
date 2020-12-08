import Foundation

/* Algorithms-Sorting Algorithms - Merge Sort */

func mergeSort(array: inout [Int], low: Int, high: Int) {
    
    if high > low {
        let mid = (low+high)/2
        
        mergeSort(array: &array, low: low, high: mid)
        mergeSort(array: &array, low: mid+1, high: high)
            
        merge(array: &array, low: low, mid: mid, high: high)
    } else {
        return
    }
}

func merge(array: inout [Int], low: Int, mid: Int, high: Int) {
    
    let n = mid - low + 1
    let m = high - mid
    
    /* Create L ← A[p..q] and R ← A[q+1..r] */
    var leftSubArray: [Int] = []
    var rightSubArray: [Int] = []
    
    for i in 0..<n {
        leftSubArray.append(array[low+i])
    }
    
    for j in 0..<m {
        rightSubArray.append(array[mid+1+j])
    }
    
    /* Maintain current index of sub-arrays and main array */
    var i = 0
    var j = 0
    var k = low
    
    /* Until we reach either end of either L or M, pick larger among elements L and M and place them in the correct position at A[p..r] */
    while i < n && j < m {
        if (leftSubArray[i] <= rightSubArray[j]) {
            array[k] = leftSubArray[i]
            i += 1
        } else {
            array[k] = rightSubArray[j]
            j += 1
        }
        k += 1
    }
    
    /* When we run out of elements in either L or M, pick up the remaining elements and put in A[p..r] */
       while (i < n) {
           array[k] = leftSubArray[i]
           i += 1
           k += 1
       }
    
       while (j < m) {
           array[k] = rightSubArray[j]
           j += 1
           k += 1
       }
}

var arr: [Int] = [1,2,3,4,5,6]
mergeSort(array: &arr, low: 0, high: arr.count-1)
print(arr)

