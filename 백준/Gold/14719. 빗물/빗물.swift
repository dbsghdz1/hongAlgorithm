import Foundation

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let N = firstLine[0]
let M = firstLine[1]

let arr = readLine()!.split(separator: " ").map { Int($0)! }
var grid = Array(repeating: Array(repeating: 0, count: M), count: N)

for i in 0..<M {
    for j in 0..<arr[i] {
        grid[j][i] = 1
    }
}

var total = 0
for g in grid {
    var water = 0
    var head = false
    for e in g {
        if e == 1 {
            if head {
                total += water
                water = 0
            }
            head = true
        } else {    
            if head {    
                water += 1
            }
        }
    }
}

print(total)