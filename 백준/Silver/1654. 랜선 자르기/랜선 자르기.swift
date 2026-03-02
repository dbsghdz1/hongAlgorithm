import Foundation

let first = readLine()!.split(separator: " ").map { Int($0)! }
let K = first[0]
let N = first[1]

var cables = [Int]()
var maxLen = 0

for _ in 0..<K {
    let x = Int(readLine()!)!
    cables.append(x)
    if x > maxLen { maxLen = x }
}

var lo = 1
var hi = maxLen
var ans = 0

while lo <= hi {
    let mid = (lo + hi) / 2
    
    var cnt = 0
    for c in cables {
        cnt += c / mid
    }
    
    if cnt >= N {
        ans = mid
        lo = mid + 1
    } else {
        hi = mid - 1
    }
}

print(ans)