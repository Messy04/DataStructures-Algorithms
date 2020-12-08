import UIKit

/*
    Given 'n' (1 <= n <= 1000) integers, find the majority element(the integer which occurs more than half times i.e more than n/2 times). if there is no such elements return -1
 
    Note:- The number in the array can contain negative numbers also
*/


func getMajorityElement(in array: [Int]) -> Int {
    // corner cases
    if array.isEmpty {
        return -1
    }
    
    var countDictionary = [Int:Int]()
    for key in array {
        if let value = countDictionary[key] {
            countDictionary[key] = value + 1
        } else {
            countDictionary[key] = 1
        }
    }
    
    var keyArray = [Int]()
    var valuesArray = [Int]()
    for (key,value) in countDictionary {
        keyArray.append(key)
        valuesArray.append(value)
    }
    let maxCount = getMaxCountIndex(array: valuesArray).0
    let index = getMaxCountIndex(array: valuesArray).1
    
    if maxCount > array.count / 2 {
        return keyArray[index]
    } else {
        return -1
    }
}

private func getMaxCountIndex(array: [Int]) -> (Int, Int) {
    var maxCount = 0
    var index = 0
    for i in 0..<array.count {
        if array[i] > maxCount {
            maxCount = array[i]
            index = i
        }
    }
    
    return (maxCount,index)
}

getMajorityElement(in: [0,-1,-2,-2,-3,-4,0,2,7,9,9,9,7,7,7,6])
