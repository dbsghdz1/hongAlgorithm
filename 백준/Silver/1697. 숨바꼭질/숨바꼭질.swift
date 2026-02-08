import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let T = input[1]

var queue: [Int] = [N]
var head = 0
var dist = Array(repeating: -1, count: 100001)
dist[N] = 0
while head < queue.count {
    let p = queue[head]
    head += 1
    
    if p == T {
        print(dist[p])
        break
    }
    
    let nexts = [p - 1, p + 1, p * 2]
    for nx in nexts {
        if nx < 0 || nx > 100000 { continue }
        if dist[nx] != -1 { continue }
        
        queue.append(nx)
        dist[nx] = dist[p] + 1
    }
}
