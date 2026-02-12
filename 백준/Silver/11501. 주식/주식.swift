import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let N = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    var answer = 0
    var maxValue = 0

    for e in arr.reversed() {
        maxValue = max(maxValue, e)
        if maxValue > e {
            answer += maxValue - e
        }
    }
    print(answer)
}