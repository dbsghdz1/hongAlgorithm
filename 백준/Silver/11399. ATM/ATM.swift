import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

let sortedArr = arr.sorted()

var prefixSum = [Int]()
var current = 0

for num in sortedArr {
    current += num
    prefixSum.append(current)
}

var sum = 0
prefixSum.forEach { sum += $0 }

print(sum)