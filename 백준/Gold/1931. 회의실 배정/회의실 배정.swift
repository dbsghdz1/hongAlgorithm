import Foundation

let N = Int(readLine()!)!

var meetings: [(s: Int, e: Int)] = []

for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    meetings.append((s: line[0], e: line[1]))
}

meetings.sort {
    if $0.e == $1.e { return $0.s < $1.s }
    return $0.e < $1.e
}

var count = 0
var lastTime = 0

for m in meetings {
    if m.s >= lastTime {
        count += 1
        lastTime = m.e
    }
}

print(count)