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

var visited = Array(repeating: false, count: N + 1)

func bfs(_ node: Int) {
    var queue = [Int]()
    var head = 0
    
    queue.append(node)
    
    while head < queue.count {
        let cur = queue[head]
        head += 1
        
        if !visited[cur] {
            visited[cur] = true
            for g in graph[cur] {
                if !visited[g] {
                    queue.append(g)
                }
            }
        } else {
            continue
        }
    }
}

bfs(1)
var answer = 0

for i in visited {
    if i {
        answer += 1
    }
}

print(answer - 1)