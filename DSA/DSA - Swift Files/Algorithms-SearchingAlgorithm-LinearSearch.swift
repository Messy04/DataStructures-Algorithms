import Foundation

/* Data Structure:- Searching(Linear Search)*/
let key = 14
let array = [1,8,3,7,10,12]

//logic
var found = false
for i in 0..<array.count {
    if array[i] == key {
        found = true
        print("Key: ",key," found @ index ->",i)
        break
    }
}

if !found {
    print("Key not found in array")
}