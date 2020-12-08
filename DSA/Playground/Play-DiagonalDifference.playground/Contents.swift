import Foundation

/*
 * Complete the 'diagonalDifference' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts 2D_INTEGER_ARRAY arr as parameter.
 */

func diagonalDifference(arr: [[Int]]) -> Int {
    // Write your code here
    let n = arr.count
    var sum1 = 0
    var sum2 = 0
    for i in 0...n-1 {
        sum1 += arr[i][i]
        sum2 += arr[i][n-1-i]
    }

    let sum = sum1 - sum2

    if sum < 0 {
        return sum*(-1)
    } else {
        return sum
    }
}

var arr = [[1,2,3],[4,5,6],[7,8,9]]

let result = diagonalDifference(arr: arr)
print(result)
