import Foundation

let N = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }
let B = readLine()!.split(separator: " ").map { Int($0)! }

let minarr = A.sorted()
let maxarr = B.sorted(by: >)
var answer = 0

for i in 0..<N {
    answer += minarr[i] * maxarr[i]
}
print(answer)