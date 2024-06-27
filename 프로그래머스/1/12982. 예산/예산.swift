import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var budget = budget
    var cnt = 0
    var arr = d
    arr.sort()
    print(arr)
    for i in arr {
        budget -= i
        if budget < 0 {
            break
        }
        cnt += 1
    }
    return cnt
}