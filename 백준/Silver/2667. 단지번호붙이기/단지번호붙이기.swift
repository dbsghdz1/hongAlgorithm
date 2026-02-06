import Foundation

let N = Int(readLine()!)!

var grid = Array(repeating: Array(repeating: 0, count: N), count: N)

for i in 0..<N {
    let line = Array(readLine()!)
    for j in 0..<N {
        grid[i][j] = line[j] == "1" ? 1 : 0
    }
}

var dx = [1, -1, 0, 0]
var dy = [0, 0, 1, -1]
var gc = [Int]()
var visited = Array(repeating: Array(repeating: false, count: N), count: N)

for i in 0..<N {
    for j in 0..<N {
        if grid[i][j] == 1 && !visited[i][j] {
            visited[i][j] = true
            
            var head = 0
            var queue = [(i, j)]
            
            //시작점의 개수 count하기
            var hc = 1
            while head < queue.count {
                let (x, y) = queue[head]
                head += 1
                
                for k in 0..<4 {
                    let nx = x + dx[k]
                    let ny = y + dy[k]
                    
                    //nx와 ny값이 유효한지 먼저 확인하고 grid접근하기
                    if nx < 0 || ny < 0 || nx >= N || ny >= N { continue }
                    if grid[nx][ny] != 1 { continue }
                    //방문 체크 
                    if visited[nx][ny] { continue }
                    visited[nx][ny] = true
                    queue.append((nx, ny))
                    hc += 1
                }
            }
            gc.append(hc)
        }
    }
}
print(gc.count)
for g in gc.sorted() {
    print(g)
}