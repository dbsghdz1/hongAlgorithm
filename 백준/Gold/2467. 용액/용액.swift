import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

let sortedArr = arr.sorted()

var l = 0
var r = sortedArr.count - 1
var best = Int.max
var ans = (0, 0)

while l < r {
    let sum = sortedArr[l] + sortedArr[r]
    let absSum = abs(sum)

    if absSum < best {
        best = absSum
        ans = (sortedArr[l], sortedArr[r])
    }

    if sum > 0 {
        r -= 1
    } else if sum < 0 {
        l += 1
    } else {
        break
    }
}

print(ans.0, ans.1)