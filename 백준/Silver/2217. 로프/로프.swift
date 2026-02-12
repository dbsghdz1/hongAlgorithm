import Foundation

let T = Int(readLine()!)!
var ropes = [Int]()

for _ in 0..<T {
    let rope = Int(readLine()!)!
    ropes.append(rope)
}

ropes.sort()

var maxW = 0

for i in 0..<T {
    let weight = ropes[i] * (T - i)
    maxW = max(maxW, weight)
}

print(maxW)