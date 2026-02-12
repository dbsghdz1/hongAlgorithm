import Foundation

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let N = firstLine[0]
let K = firstLine[1]

var target = K
var coins = [Int]()
var count = 0

for _ in 0..<N {
    let value = Int(readLine()!)!
    coins.append(value)
}

coins.sort(by: >)

for c in coins {
    if target == 0 { break }
    if c <= target {
        let use = target / c
        count += use
        target %= c
    }
}

print(count)
