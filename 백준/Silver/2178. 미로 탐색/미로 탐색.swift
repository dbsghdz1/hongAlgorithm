import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var graph: [[Int]] = []

for _ in 0..<n {
    let row = readLine()!.map { Int(String($0))! }
    graph.append(row)
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var dist = Array(repeating: Array(repeating: 0, count: m), count: n)
dist[0][0] = 1
var queue = [(0, 0)]
var index = 0

while index < queue.count {
    let (x, y) = queue[index]
    index += 1
    for k in 0..<4 {
        let nx = x + dx[k]
        let ny = y + dy[k]
        
        if nx >= 0 && nx < n && ny >= 0 && ny < m {
            if graph[nx][ny] != 0 && dist[nx][ny] == 0 {
                queue.append((nx, ny))
                dist[nx][ny] = dist[x][y] + 1
            }
        }
    }
}

print(dist[n-1][m-1])