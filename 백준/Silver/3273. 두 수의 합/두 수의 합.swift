import Foundation

let N = Int(readLine()!)!

var arr = readLine()!.split(separator: " ").map { Int($0)! }

let X = Int(readLine()!)!

var l = 0
var r = N - 1
var answer = 0
arr.sort()

while l < r {
    let sum = arr[l] + arr[r]
    if sum == X {
        answer += 1
        l += 1
        r -= 1
    } else if sum < X {
        l += 1
    } else {
        r -= 1
    }
}

print(answer)