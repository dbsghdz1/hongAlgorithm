import Foundation

let first = readLine()!.split(separator: " ").map { Int($0)! }
let N = first[0]
let M = first[1]

var graph = Array(repeating: [Int](), count: N)

for _ in 0..<M {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let a = edge[0]
    let b = edge[1]

    graph[a].append(b)
    graph[b].append(a)
}

var visited = Array(repeating: false, count: N)

var found = false

func dfs(_ node: Int, _ depth: Int) {
    
    if depth == 4 {
        found = true
        return
    }
    
    visited[node] = true
    
    for next in graph[node] {
        if !visited[next] {
            dfs(next, depth + 1)
        }
    }
    
    visited[node] = false
}

for i in 0..<N {
    dfs(i, 0)
    if found { break }
}

print(found ? 1 : 0)