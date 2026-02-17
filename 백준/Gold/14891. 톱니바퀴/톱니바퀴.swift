import Foundation

var gears = Array(repeating: Array(repeating: 0, count: 8), count: 4)

for i in 0..<4 {
    let s = Array(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))
    for j in 0..<8 {
        gears[i][j] = (s[j] == "1") ? 1 : 0
    }
}

let K = Int(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))!

var queries: [(idx: Int, dir: Int)] = []
var twPoint = [0, 0, 0, 0]

for _ in 0..<K {
    let parts = readLine()!.split(separator: " ").map { Int($0)! }
    let idx = parts[0] - 1
    let dir = parts[1]
    queries.append((idx, dir))
}

func rotate(_ gear: inout [Int], _ dir: Int) {
    if dir == 1 {
        gear.insert(gear.removeLast(), at: 0)
    } else if dir == -1 {
        gear.append(gear.removeFirst())
    }
}

for (idx, dir) in queries {

    var rotateDir = Array(repeating: 0, count: 4)
    rotateDir[idx] = dir

    for i in idx..<3 {
        if gears[i][2] != gears[i+1][6] {
            rotateDir[i+1] = -rotateDir[i]
        } else { break }
    }
    
    for i in stride(from: idx, to: 0, by: -1) {
        if gears[i][6] != gears[i-1][2] {
            rotateDir[i-1] = -rotateDir[i]
        } else { break }
    }

    for i in 0..<4 {
        if rotateDir[i] != 0 {
            rotate(&gears[i], rotateDir[i])
        }
    }
}

var answer = 0

for (index, gear) in gears.enumerated() {
    if gear[0] != 0 {
        if index == 0 {
            answer += 1
        } else if index == 1 {
            answer += 2
        } else if index == 2 {
            answer += 4
        } else {
            answer += 8
        }
    }
}
print(answer)
