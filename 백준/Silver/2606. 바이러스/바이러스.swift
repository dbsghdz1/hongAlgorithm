import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!

var graph = Array(repeating: [Int](), count: N + 1)

for _ in 0..<M {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let a = edge[0]
    let b = edge[1]

    graph[a].append(b)
    graph[b].append(a)
}

var visited = Array(repeating: false, count: N + 1)
var answer = 0
func dfs(_ node: Int) {
    visited[node] = true
    
    for next in graph[node] {
        if !visited[next] {
            dfs(next)
            answer += 1
        }
    }
}

dfs(1)

print(answer)