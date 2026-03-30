import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph = Array(repeating: [Int](), count: n + 1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0]
    let v = input[1]
    
    graph[u].append(v)
    graph[v].append(u)
}

var answer = 0
var visited = Array(repeating: false, count: n + 1)

func dfs(start: Int) {
    visited[start] = true
    for g in graph[start] {
        if !visited[g] {
            answer += 1
            dfs(start: g)
        }
    }
}

dfs(start: 1)

print(answer)
