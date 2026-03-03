import Foundation

let first = readLine()!.split(separator: " ").map { Int($0)! }
let N = first[0]
let M = first[1]

var graph = Array(repeating: [Int](), count: N + 1)
for _ in 0..<M {
    let e = readLine()!.split(separator: " ").map { Int($0)! }
    let u = e[0]
    let v = e[1]
    graph[u].append(v)
    graph[v].append(u)
}

var visited = Array(repeating: false, count: N + 1)
var answer = 0

for start in 1...N {
    if visited[start] { continue }
    answer += 1

    var queue = [Int]()
    queue.append(start)
    visited[start] = true
    var head = 0

    while head < queue.count {
        let cur = queue[head]
        head += 1

        for nxt in graph[cur] {
            if !visited[nxt] {
                visited[nxt] = true
                queue.append(nxt)
            }
        }
    }
}

print(answer)