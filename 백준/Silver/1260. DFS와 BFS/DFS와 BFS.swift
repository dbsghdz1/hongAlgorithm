import Foundation

let first = readLine()!.split(separator: " ").map { Int($0)! }
let N = first[0]
let M = first[1]
let V = first[2]

var graph = Array(repeating: [Int](), count: N + 1)

for _ in 0..<M {
    let e = readLine()!.split(separator: " ").map { Int($0)! }
    let u = e[0]
    let v = e[1]
    graph[u].append(v)
    graph[v].append(u)
}

for i in 1...N {
    graph[i].sort()
}

var visited = Array(repeating: false, count: N + 1)
var visited2 = Array(repeating: false, count: N + 1)

func dfs(_ node: Int) {
    visited[node] = true
    print(node, terminator: " ")
    for next in graph[node] {
        if !visited[next] {
            dfs(next)
        }
    }
}

func bfs(_ start: Int) {
    var queue = [Int]()
    var head = 0
    queue.append(start)
    visited2[start] = true

    while head < queue.count {
        let cur = queue[head]
        head += 1

        print(cur, terminator: " ")
        for next in graph[cur] {
            if !visited2[next] {
                visited2[next] = true
                queue.append(next)
            }
        }
    }
}

dfs(V)
print()
bfs(V)