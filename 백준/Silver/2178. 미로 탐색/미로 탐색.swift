import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let N = nm[0]
let M = nm[1]

var grid = Array(repeating: Array(repeating: 0, count: M), count: N)
for i in 0..<N {
    let line = Array(readLine()!)
    for j in 0..<M {
        grid[i][j] = (line[j] == "1") ? 1 : 0
    }
}

let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]

var dist = Array(repeating: Array(repeating: 0, count: M), count: N)
var queue: [(Int, Int)] = [(0, 0)]
var head = 0
dist[0][0] = 1

while head < queue.count {
    let (y, x) = queue[head]
    head += 1

    for k in 0..<4 {
        let ny = y + dy[k]
        let nx = x + dx[k]

        if ny < 0 || ny >= N || nx < 0 || nx >= M { continue }
        if grid[ny][nx] == 0 { continue }
        if dist[ny][nx] != 0 { continue }

        dist[ny][nx] = dist[y][x] + 1
        queue.append((ny, nx))
    }
}

print(dist[N-1][M-1])