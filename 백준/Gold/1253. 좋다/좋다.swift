import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }

arr.sort()
var l = 0
var r = N - 2
var answer = 0

for i in stride(from: N-1, through: 0, by: -1) {
    var l = 0
    var r = N - 1
    let target = arr[i]
   
    
    while l < r {
         if l == i { l += 1; continue }
        if r == i { r -= 1; continue }
        var sum = arr[l] + arr[r]
        if sum == target {
            answer += 1
            break
        } else if sum > target {
            r -= 1
        } else {
            l += 1
        }
    }
}

print(answer)