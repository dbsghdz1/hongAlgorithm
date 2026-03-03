import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!

var graph = Array(repeating: [Int](), count: N + 1)

for _ in 0..<M {
    let e = readLine()!.split(separator: " ").map { Int($0)! }
    let u = e[0]
    let v = e[1]
    
    graph[u].append(v)
    graph[v].append(u)
}

var dist = Array(repeating: -1, count: N + 1)
var queue = [Int]()
var head = 0

dist[1] = 0
queue.append(1)

while head < queue.count {
    let cur = queue[head]
    head += 1
    
    if dist[cur] == 2 { continue }
    
    for nxt in graph[cur] {
        if dist[nxt] == -1 {
            dist[nxt] = dist[cur] + 1
            queue.append(nxt)
        }
    }
}

var answer = 0
for i in 2...N {
    if dist[i] == 1 || dist[i] == 2 {
        answer += 1
    }
}

print(answer)