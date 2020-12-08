import UIKit

/*
    Problem Statement:- Convert a C++ variable name with a Java variable name and vice-versa.
    C++ variable name - this_is_a_variable
    Java variable name - thisIsAVariable
*/
func changeVariableName(string: String) -> String {
    // corner cases checks
    if string.isEmpty {
        return string
    }
    
    // main logic of the method
    if string.contains("_") {
        // Its, C++ Variable
        let seperatedArray = string.split(separator: "_")
        if !seperatedArray.isEmpty {
            var changedName: String = String(seperatedArray[0])
            for i in 1..<seperatedArray.count {
                changedName.append(seperatedArray[i].capitalized)
            }
            return changedName
        }
        return ""
    } else {
        // It's,Java Variable
        var seperatedString = ""
        for element in Array(string) {
            if element.isUppercase {
                seperatedString += " "
            }
            seperatedString += element.lowercased()
        }
        return seperatedString.replacingOccurrences(of: " ", with: "_")
    }
}

let changedName = changeVariableName(string: "this_is_a_variable")

