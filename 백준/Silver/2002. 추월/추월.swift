import Foundation

let N = Int(readLine()!)!

var pos = [String: Int]()
pos.reserveCapacity(N)

for i in 0..<N {
    let car = readLine()!
    pos[car] = i
}

var out = [Int]()
out.reserveCapacity(N)

for _ in 0..<N {
    let car = readLine()!
    out.append(pos[car]!)
}

var minSuffix = Array(repeating: Int.max, count: N + 1)
for i in stride(from: N - 1, through: 0, by: -1) {
    minSuffix[i] = min(out[i], minSuffix[i + 1])
}

var answer = 0
for i in 0..<N {
    if out[i] > minSuffix[i + 1] { 
        answer += 1
    }
}

print(answer)