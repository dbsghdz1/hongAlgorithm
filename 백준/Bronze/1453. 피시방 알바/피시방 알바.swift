import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var pc = Array(repeating: 0, count: 101)
var answer = 0

for i in arr {
    if pc[i] == 0 {
        pc[i] = 1
    } else {
        answer += 1
    }
}
print(answer)