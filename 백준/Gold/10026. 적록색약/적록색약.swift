import Foundation

let N = Int(readLine()!)!
var grid = [[Character]]()

for _ in 0..<N {
    let line = Array(readLine()!)
    grid.append(line)
}

var visited = Array(repeating: Array(repeating: false, count: N), count: N)
let sGrid = grid.map { row in
    row.map { $0 == "R" ? "G" : $0 }
}
var dx = [1, -1, 0, 0]
var dy = [0, 0, 1, -1]
var count = 0
var sCount = 0

var sWord: Character = " "
for i in 0..<N {
    for j in 0..<N {
        if !visited[i][j] {
            visited[i][j] = true
            count += 1
            var queue = [(i, j)]
            var head = 0
            sWord = grid[i][j]
            while head < queue.count {
                let (x, y) = queue[head]
                head += 1
                for k in 0..<4 {
                    let nx = x + dx[k]
                    let ny = y + dy[k]
                    
                    if nx < 0 || ny < 0 || nx >= N || ny >= N { continue }
                    if visited[nx][ny] { continue }
                    if sWord != grid[nx][ny] { continue }
                    visited[nx][ny] = true
                    queue.append((nx, ny))
                }
            }
        }
    }
}

visited = Array(repeating: Array(repeating: false, count: N), count: N)
for i in 0..<N {
    for j in 0..<N {
        if !visited[i][j] {
            visited[i][j] = true
            sCount += 1
            
            var queue = [(i, j)]
            var head = 0
            sWord = sGrid[i][j]
            while head < queue.count {
                let (x, y) = queue[head]
                head += 1
                for k in 0..<4 {
                    let nx = x + dx[k]
                    let ny = y + dy[k]
                    
                    if nx < 0 || ny < 0 || nx >= N || ny >= N { continue }
                    if visited[nx][ny] { continue }
                    if sWord != sGrid[nx][ny] { continue }
                    visited[nx][ny] = true
                    queue.append((nx, ny))
                }
            }
        }
    }
}

print(count, sCount)