import Foundation

let N = Int(readLine()!)!

var arr = [Int]()
arr.reserveCapacity(N)

for _ in 0..<N {
    arr.append(Int(readLine()!)!)
}

var dict: [Int: Int] = [:]
var maxCount = 0
var value = 0

arr.sort()

for a in arr {
    dict[a, default: 0] += 1
}

let sum = arr.reduce(0, +)
print(Int((Double(sum) / Double(N)).rounded()))
print(arr[N/2])
let maxFreq = dict.values.max()!
var modes = [Int]()
for (k, v) in dict {
    if v == maxFreq {
        modes.append(k)
    }
}
modes.sort()
print(modes.count >= 2 ? modes[1] : modes[0])
print(arr.max()! - arr.min()!)
