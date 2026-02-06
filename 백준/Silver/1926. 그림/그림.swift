import Foundation

let first = readLine()!.split(separator: " ").map { Int($0)! }
let n = first[0]
let m = first[1]

var grid = [[Int]]()
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    grid.append(row)
}

var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var qu: [(Int, Int)] = [(0, 0)]
var dx = [1, -1, 0, 0]
var dy = [0, 0, 1, -1]
var position = (0, 0)
var picCount = 0
var maxArea = 0

for i in 0..<n {
    for j in 0..<m {
        if grid[i][j] == 1 && !visited[i][j] {
            picCount += 1
            
            var queue: [(Int, Int)] = [(i, j)]
            var head = 0
            visited[i][j] = true
            var area = 1
            
            while head < queue.count {
                let (x, y) = queue[head]
                head += 1
                
                for k in 0..<4 {
                    let nx = x + dx[k]
                    let ny = y + dy[k]
                    
                    if nx < 0 || nx >= n || ny < 0 || ny >= m { continue }
                    if visited[nx][ny] { continue }
                    if grid[nx][ny] == 0 { continue }
                    
                    visited[nx][ny] = true
                    queue.append((nx,ny))
                    area += 1
                }
            }
            maxArea = max(maxArea, area)
        }
    }
}

print(picCount)
print(maxArea)