import Foundation

let info = readLine()!.split(separator: " ").map { Int($0)! }
let M = info[0]
let N = info[1]
let K = info[2]

var rects = [(Int, Int, Int, Int)]()

for _ in 0..<K {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let x1 = line[0]
    let y1 = line[1]
    let x2 = line[2]
    let y2 = line[3]
    rects.append((x1, y1, x2, y2))
}

var grid = Array(repeating: Array(repeating: 0, count: N), count: M)
var visited = Array(repeating: Array(repeating: false, count: N), count: M)

for r in rects {
    let (x1, y1, x2, y2) = r
    
    for y in y1..<y2 {
        for x in x1..<x2 {
            grid[y][x] = 1
        }
    }
}

var dx = [1, -1, 0, 0]
var dy = [0, 0, 1, -1]
var count = 0    
var areaArr = [Int]()

for i in 0..<M {
    for j in 0..<N {
        if grid[i][j] == 0 && !visited[i][j] {
            visited[i][j] = true 
            
            var area = 1
            var queue = [(i, j)]
            var head = 0
            
            while head < queue.count {
                let (x, y) = queue[head]
                head += 1
                
                for k in 0..<4 {
                    let nx = x + dx[k]
                    let ny = y + dy[k]
                    
                    if nx < 0 || ny < 0 || nx >= M || ny >= N { continue }
                    if visited[nx][ny] { continue }
                    if grid[nx][ny] != 0 { continue }
                    
                    visited[nx][ny] = true
                    queue.append((nx, ny))
                    area += 1
                }
            }
            areaArr.append(area)
        }
    }
}

areaArr.sort()
print(areaArr.count)
print(areaArr.map(String.init).joined(separator: " "))