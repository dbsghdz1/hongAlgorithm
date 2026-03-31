import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var grid = (0..<m).map { _ in
    readLine()!.split(separator: " ").map { Int($0)! }
}

var dist = Array(repeating: Array(repeating: 0, count: n), count: m)
var head = 0
var queue: [(Int, Int)] = []

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

for (i, g) in grid.enumerated() {
    for (j, t) in g.enumerated() {
        if t == 1 {
            queue.append((i, j))
            dist[i][j] = 1
        }
    }
}

while head < queue.count {
    let (x, y) = queue[head]
    head += 1
    
    for k in 0..<4 {
        let nx = x + dx[k]
        let ny = y + dy[k]
        
        if nx < 0 || nx >= m || ny < 0 || ny >= n { continue }
        if grid[nx][ny] != 0 { continue }
        if dist[nx][ny] != 0 { continue }
        
        dist[nx][ny] = dist[x][y] + 1
        queue.append((nx, ny))
    }
}

var max = 0
var flag = false

for i in 0..<m {
    for j in 0..<n {
        if grid[i][j] == 0 && dist[i][j] == 0 {
            print(-1)
            exit(0)
        }
    }
}


    for d in dist {
        for v in d {
            if max < v {
                max = v 
            }
        }
    }
    print(max - 1)
