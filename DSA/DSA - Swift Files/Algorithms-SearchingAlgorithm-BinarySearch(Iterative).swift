import Foundation

/* Data Structure:- Searching(Binary Search) */
let sortedArray = [4,6,9,12,14,20,25,32,38,41,56,72,89,100]
let key = 89

func binarySearch(arr: [Int], key: Int) {

    var low = 0
    var high = arr.count-1
    var found = false
    while low <= high {
        let mid = (low+high)/2
        if arr[mid] == key {
            print("Key found @ index: ",mid)
            found = true
            break
        }else if key > arr[mid] {
            low = mid+1
            continue
        }else if key < arr[mid]{
            high = mid-1
            continue
        }
    }

    if !found{
        print("Key not found")
    }
}

binarySearch(arr: sortedArray, key: key)