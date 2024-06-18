import Foundation

func solution(_ s:String) -> Int {
    var first = ""
    var cnt = 0
    var cnt2 = 0
    var result = 0

    for i in s {
        if (first == "") {
            first = String(i)
        }
        
        if (first == String(i)) {
            cnt += 1
        } else {
            cnt2 += 1
        }
        
        if (cnt == cnt2) {
            first = ""
            cnt = 0
            cnt2 = 0
            result += 1
        }
    }
    if (first != "") {
        result += 1
    }
    return result
}