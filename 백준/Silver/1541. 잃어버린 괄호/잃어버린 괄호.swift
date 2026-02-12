import Foundation

let expr = readLine()!
let parts = expr.split(separator: "-")

func sumPlus(_ s: Substring) -> Int {
    s.split(separator: "+").reduce(0) { $0 + Int($1)! }
}

var ans = sumPlus(parts[0])
for i in 1..<parts.count {
    ans -= sumPlus(parts[i])
}

print(ans)