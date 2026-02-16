import Foundation

let T = Int(readLine()!)!
var comb = Array(repeating: Array(repeating: 0, count: 31), count: 31)

for n in 0...30 {
    comb[n][0] = 1
    comb[n][n] = 1
    if n >= 2 {
        for r in 1..<(n) {
            comb[n][r] = comb[n-1][r-1] + comb[n-1][r]
        }
    }
}

var output = ""
for _ in 0..<T {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let N = line[0]
    let M = line[1]
    output += "\(comb[M][N])\n"
}

print(output, terminator: "")