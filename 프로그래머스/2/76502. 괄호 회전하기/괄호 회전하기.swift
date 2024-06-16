import Foundation

func solution(_ s:String) -> Int {
    var answer = 0
    var str = Array(s)
    for i in 0..<str.count {
        if check(str) {
            answer += 1
        }
        for j in 1..<s.count {
            str.swapAt(j - 1, j)
        }
    }
    return answer
}

func check(_ arr:[Character]) -> Bool {
    var arr1: [Character] = []
    for i in arr {
        if i == "{" || i == "[" || i == "(" {
            arr1.append(i)
        } else {
            if arr1.isEmpty {
                return false
            } else {
                if arr1[arr1.count - 1] == "{" && i != "}" {
                    return false
                } else if arr1[arr1.count - 1] == "(" && i != ")" {
                    return false
                } else if arr1[arr1.count - 1] == "[" && i != "]" {
                    return false
                }
            }
            arr1.removeLast()
        }
    }
    if arr1.isEmpty {
        return true
    }
    return false
}