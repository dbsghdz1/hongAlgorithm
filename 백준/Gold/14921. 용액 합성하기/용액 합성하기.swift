import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }

arr.sort()

var min = Int.max
var answer = 0

var l = 0
var r = arr.count - 1

while l < r {
    let sum = arr[l] + arr[r]
    
    if abs(sum) < min {
        min = abs(sum)
        answer = sum
    }
    
    if sum > 0 {
        r -= 1
    } else if sum < 0 {
        l += 1
    } else {
        break
    }
}

print(answer)