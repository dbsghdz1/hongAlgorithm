import Foundation

let N = Int(readLine()!)!

var arr = [[Int]]()

for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append(line)
}
var count = 0
var dx = [1, -1, 0, 0]
var dy = [0, 0, 1, -1]

for h in 0..<100 {
    var area = 0
    var visited = Array(repeating: Array(repeating: false, count: N), count: N)
    for i in 0..<N {
        for j in 0..<N {
            if arr[i][j] <= h && arr[i][j] != 0 {
                arr[i][j] = 0
            }
        }
    }
    
    for i in 0..<N {
        for j in 0..<N {
            if arr[i][j] != 0 && !visited[i][j] {
                visited[i][j] = true
                var queue = [(i, j)]
                var head = 0
                area += 1
                while head < queue.count {
                    let (x, y) = queue[head]
                    head += 1
                    for k in 0..<4 {
                        let nx = x + dx[k]
                        let ny = y + dy[k]
                        
                        if nx < 0 || ny < 0 || nx >= N || ny >= N { continue }
                        if visited[nx][ny] { continue }
                        if arr[nx][ny] == 0 { continue }
                        
                        visited[nx][ny] = true
                        queue.append((nx, ny))
                    }
                }
            }
        }
    }
    count = max(count, area)
}

print(count)