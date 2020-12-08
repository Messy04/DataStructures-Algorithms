import Foundation

/* Searching Algorithm(Naive Algorithm):- Searching a Substring inside a String */

//Declaring & Defining the variables
let mainStr = "ABABABCABABABCABABABC"
let searchStr = "ABABAC"

//Convert string into array
let mainStrArr = Array(mainStr)
let searchStrArr = Array(searchStr)

//Return is string to search is greater than main string
if mainStr.count < searchStr.count {
    print("Can't compare a larger substring to a smaller substring")
}

// Function to generate a substring from given index till the count of the string to search - 1
func generateSubstring(from index: Int) -> [Character]{
    var c:[Character] = []
    for i in index...(index+searchStrArr.count-1) {
        c.append(mainStrArr[i])
    }
    return c
}

func searchSubstring(searchArr: [Character],mainArr: [Character]) {
    var matched = false
    for i in 0...(mainArr.count - searchArr.count) {
        let substrArr = generateSubstring(from: i)
        if substrArr == searchArr {
            print("Matched @: ",i)
            matched = true
        }
    }

    if !matched {
        print("Substring did not match.")
    }
}

searchSubstring(searchArr: searchStrArr,mainArr: mainStrArr)


