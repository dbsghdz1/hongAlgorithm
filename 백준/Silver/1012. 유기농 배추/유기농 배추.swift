import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    let M = info[0]
    let N = info[1]
    let K = info[2]

    var field = Array(repeating: Array(repeating: 0, count: M), count: N)
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    
    for _ in 0..<K {
        let pos = readLine()!.split(separator: " ").map { Int($0)! }
        let x = pos[0]
        let y = pos[1]
        field[y][x] = 1
    }
    
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    var count = 0
    
    for i in 0..<N {
        for j in 0..<M {
            //BFS 시작지점을 찾기 if문으로
            if field[i][j] == 1 && !visited[i][j] {
                count += 1
                
                var queue: [(Int, Int)] = [(j, i)]
                var head = 0
                visited[i][j] = true
                
                while head < queue.count {
                    let (x, y) = queue[head]
                    head += 1
                    for k in 0..<4 {
                        let nx = x + dx[k]
                        let ny = y + dy[k]
                    
                        if nx < 0 || ny < 0 || nx >= M || ny >= N { continue }
                        if visited[ny][nx] { continue }
                        if field[ny][nx] == 0 { continue }
                        
                        visited[ny][nx] = true
                        queue.append((nx, ny))
                    }
                }
            }
        }
    }
    print(count)
}