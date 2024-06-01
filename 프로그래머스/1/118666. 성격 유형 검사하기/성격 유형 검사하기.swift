import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var dict: [String: Int] = ["A": 0, "C": 0, "F":0, "J":0, "M":0, "N":0, "R":0, "T":0]
    var idx = 0
    var mbti = ""
    for i in survey {
        var arr = Array(i)
        if (choices[idx] < 4) {
            addValue(forKey: String(arr[0]), value: 4 - Int(choices[idx]), to: &dict)
        } else if (choices[idx] > 4) {
             addValue(forKey: String(arr[1]), value: Int(choices[idx]) - 4, to: &dict)
        }
        idx += 1
    }
    if (dict["R"]! > dict["T"]!) {
        mbti += "R"
    } else if (dict["R"]! == dict["T"]!) {
        mbti += "R"
    } else {
        mbti += "T"
    }
    
    if (dict["C"]! > dict["F"]!) {
        mbti += "C"
    } else if (dict["C"]! == dict["F"]!) {
        mbti += "C"
    } else {
        mbti += "F"
    }
    if (dict["J"]! > dict["M"]!) {
        mbti += "J"
    } else if (dict["J"]! == dict["M"]!) {
        mbti += "J"
    } else {
        mbti += "M"
    }
    if (dict["A"]! > dict["N"]!) {
        mbti += "A"
    } else if (dict["A"]! == dict["N"]!) {
        mbti += "A"
    } else {
        mbti += "N"
    }
    return mbti
}
func addValue(forKey key: String, value: Int, to dictionary: inout [String: Int]) {
    if let currentValue = dictionary[key] {
        dictionary[key] = currentValue + value
    } else {
        dictionary[key] = value
    }
}