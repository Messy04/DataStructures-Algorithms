import Foundation

/* Data Structure:- Searching(Binary Search) */
let sortedArray = [4,6,9,12,14,20,25,32,38,41,56,72,89,100]
let key = 32
var found = false

func binarySearch(arr: [Int], key: Int,low: Int, high: Int) -> Bool{
    let mid = (low+high)/2
    if low > high {
        return false 
    } else{
        if arr[mid] == key {
            print("Key found @ index: ",mid)
            found = true
            return true
        } else if key > arr[mid] {
            binarySearch(arr: arr, key: key,low: mid+1, high: high)
            return false
        } else {
            binarySearch(arr: arr, key: key,low: low, high: mid-1)
            return false
        }
    }
}

binarySearch(arr: sortedArray, key: key,low: 0, high: sortedArray.count-1)
if !found {
    print("Key not found")
}
