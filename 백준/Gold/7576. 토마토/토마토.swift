import Foundation

let first = readLine()!.split(separator: " ").map { Int($0)! }
let M = first[0]   // 가로 (열)
let N = first[1]   // 세로 (행)

var box = [[Int]]()
var queue: [(Int, Int)] = []
var dist = Array(repeating: Array(repeating: -1, count: M), count: N)
var head = 0
let dr = [-1, 1, 0, 0]
let dc = [0, 0, -1, 1]

for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    box.append(row)
}

for r in 0..<N {
    for c in 0..<M {
        if box[r][c] == 1 {
            queue.append((r, c))
            dist[r][c] = 0
        }
    }
}

while head < queue.count {
    let (r, c) = queue[head]
    head += 1
    
    for k in 0..<4 {
        let nr = r + dr[k]
        let nc = c + dc[k]
        
        if nr < 0 || nc < 0 || nr >= N || nc >= M {
            continue 
        }
        if box[nr][nc] != 0 { continue }
        if dist[nr][nc] != -1 { continue }
        
        dist[nr][nc] = dist[r][c] + 1
        box[nr][nc] = 1
        queue.append((nr, nc))
    }
}

var answer = 0

for i in 0..<N {
    for j in 0..<M {
        if box[i][j] == 0 {
            print(-1)
            exit(0)
        }
        answer = max(answer, dist[i][j])
    }
}

print(answer)