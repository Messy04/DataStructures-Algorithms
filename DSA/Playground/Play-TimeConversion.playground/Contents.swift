import Foundation

/*
 * Complete the timeConversion function below.
 */
func timeConversion(s: String) -> String {
    let timeArr = Array(s)
    var updateArr = timeArr
    let count = timeArr.count

    var hh = Int("\(timeArr[0])\(timeArr[1])")
    let type = "\(timeArr[count-2])\(timeArr[count-1])"

    if type == "PM" && hh ?? 0 < 12 {
        hh = hh!+12
        let hhStr = "\(hh ?? 0)"
        updateArr[0] = hhStr.first ?? " "
        updateArr[1] = hhStr.last ?? " "
    } else if type == "AM" && hh == 12 {
        updateArr[0] = "0"
        updateArr[1] = "0"
    }
    updateArr.remove(at: updateArr.count-1)
    updateArr.remove(at: updateArr.count-1)
    return String(updateArr)
}

let result = timeConversion(s: "12:45:54PM")
print(result)
