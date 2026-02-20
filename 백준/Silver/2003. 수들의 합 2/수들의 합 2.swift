import Foundation

let first = readLine()!.split(separator: " ").map { Int($0)! }
let N = first[0]
let M = first[1]

let arr = readLine()!.split(separator: " ").map { Int($0)! }

var start = 0
var end = 0
var sum = 0
var count = 0

while true {
    if sum >= M {
        if sum == M { count += 1 }
        sum -= arr[start]
        start += 1
    } else {
        if end == N { break }
        sum += arr[end]
        end += 1
    }
}
print(count)