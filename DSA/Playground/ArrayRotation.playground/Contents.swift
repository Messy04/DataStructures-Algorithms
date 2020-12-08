import UIKit
/* Program to rotate an array */

/// Enum to detrmine the direction in which the array is to be rotated
/// left, when the array elements is to shifted leftwards
/// right, when the array elements is to shifted rightwards
/// Default is left
enum RotationDirection {
    case left
    case right
}

var ar1 = [1,2,3,4,5,6,7]
var ar2 = [1,2,3,4,5,6,7]

// MARK:- Method 1 - Using a Temp Array

/// Rotate array in the specified direction
/// - Parameters:
///   - arr: Array whose elements needs to be rotated.
///   - units: Units by which the elements needs to be shifted.
///   - direction: Direction in which the array elements needs to be shifted, Default is left.
/// - Returns: Returns the rotated array
/// - Author: Rishab Singh
func rotateMethod1(arr: [Int], units: Int, direction: RotationDirection = .left) -> [Int] {
    
    // Validation checks
    if units == arr.count {
        return arr
    }
    
    if units > arr.count || units < 0 {
        print("Units can't be greater than \(arr.count) and less than 0")
        return []
    }
    
    if units == 0 {
        return arr
    }
    
    // Method main logic
    var tempArray = [Int]()
    switch direction {
    case .left:
        // store the element count to be rotated in a temp array
        for i in 0..<units {
            tempArray.append(arr[i])
        }
        
        // shift the array in left direction
        let index = arr.count - 1 - units
        for i in 0...index {
            ar1[i] = arr[i + units]
        }
        
        // add the elements of temp array in the main array
        for _ in 0..<tempArray.count {
            ar1.removeLast()
        }
        ar1.append(contentsOf: tempArray)
    case .right:
        let index = arr.count - 1 - units
        // store the element count to be rotated in a temp array
        for i in index + 1..<arr.count {
            tempArray.append(arr[i])
        }
        // add the elements of temp array in the main array
        ar1 = tempArray
        
        // shift the array in right direction
        for i in 0...index {
            ar1.append(arr[i])
        }
    }
    return ar1
}

// MARK:- Method 2 - Rotate elements one by one

/// Rotate array in the specified direction
/// - Parameters:
///   - arr: Array whose elements needs to be rotated.
///   - units: Units by which the elements needs to be shifted.
///   - direction: Direction in which the array elements needs to be shifted, Default is left.
/// - Returns: Returns the rotated array
/// - Author: Rishab Singh
func rotateMethod2(arr: inout [Int], units: Int, direction: RotationDirection = .left) -> [Int] {
    
    // Validation checks
    if units == arr.count {
        return arr
    }
    
    if units > arr.count || units < 0 {
        print("Units can't be greater than \(arr.count) and less than 0")
        return []
    }
    
    if units == 0 {
        return arr
    }
    
    // rotate array elements by one in the specified direction
    for _ in 1...units {
        rotateByOne(arr: &arr, direction: direction)
    }
    
    return arr
}

func rotateByOne(arr: inout [Int], direction: RotationDirection = .left) {
    switch direction {
    case .left:
        let temp = arr[0]
        for i in 0..<arr.count {
            if i < arr.count - 1 {
               arr[i] = arr[i + 1]
            }
        }
        arr[arr.count - 1] = temp
    case .right:
        let temp = arr[arr.count - 1]
        var i = arr.count - 1
        while i > 0 {
            arr[i] = arr[i - 1]
            i -= 1
        }
        arr[0] = temp
    }
}

print(rotateMethod1(arr: ar1, units: 1, direction: .left))
print(rotateMethod2(arr: &ar2, units: 1, direction: .left))
