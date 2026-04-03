import Foundation

let first = readLine()!.split(separator: " ").map { Int($0)! }
let n = first[0]
let m = first[1]
let v = first[2]

var edges: [(Int, Int)] = []

for _ in 0..<m {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let a = line[0]
    let b = line[1]
    edges.append((a, b))
}

var graph = Array(repeating: [Int](), count: n + 1)

for (a, b) in edges {
    graph[a].append(b)
    graph[b].append(a)
}

for i in 1...n {
    graph[i].sort()
}
var visited = Array(repeating: false, count: n + 1)

func dfs(_ node: Int) {
    visited[node] = true
    print(node, terminator: " ")
    
    for nx in graph[node] {
        if !visited[nx] {
            dfs(nx)
        }
    }
}

var visited2 = Array(repeating: false, count: n + 1)

func bfs(value: Int) {
    var queue = [value]
    visited2[value] = true
    var head = 0
    
    while head < queue.count {
        let cur = queue[head]
        print(cur, terminator: " ")
        head += 1
        
        for nx in graph[cur] {
            if !visited2[nx] {
                visited2[nx] = true
                queue.append(nx)
            }
        }
    }
}
dfs(v)
print()
bfs(value: v)
