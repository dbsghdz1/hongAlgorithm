import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    var ans = 0
    var a = A.sorted()
    var b = B.sorted(by: >)
    for i in 0..<A.count {
        ans += a[i] * b[i]
    }
    return ans
}