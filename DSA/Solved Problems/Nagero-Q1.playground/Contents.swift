import UIKit

/*
    Problem Statement:- Given an input string count the frequency of each characters and append it next to the character in output string in alphabetical order.
*/


func getStringCharacterCount(str: String) -> String {
    
    if str.isEmpty {
        return ""
    }
    
    let strArray = Array(str)
    var charCountDict: [String: Int] = [:]
    
    // store keys and its count in a dictionary
    for value in strArray {
        if let _ = charCountDict.index(forKey: "\(value)") {
            let count = charCountDict["\(value)"]
            charCountDict["\(value)"] = count! + 1
        } else {
            // key is not in the dictionary
            charCountDict["\(value)"] = 1
        }
    }
    
    // store keys in a sorted array and find the count of the key from dictioanary one by one
    let keys = charCountDict.keys.sorted()
    var text = ""
    for key in keys {
        let count = charCountDict[key]
        text += "\(key)\(count ?? 0)"
    }
    return text
}

getStringCharacterCount(str: "phqgh")

