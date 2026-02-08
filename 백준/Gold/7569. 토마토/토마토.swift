import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let M = input[0]
let N = input[1]
let H = input[2]

var box = Array(repeating: Array(repeating: Array(repeating: 0, count: M),count: N),count: H)
var dist = Array(repeating: Array(repeating: Array(repeating: -1, count: M),count: N),count: H)
var queue: [(Int, Int, Int)] = []
var head = 0

for z in 0..<H {
    for x in 0..<N {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        for y in 0..<M {
            box[z][x][y] = line[y]
            if line[y] == 1 {
                queue.append((z, x, y))
                dist[z][x][y] = 0
            }
        }
    }
}

let dx = [-1, 1, 0, 0, 0, 0]
let dy = [0, 0, -1, 1, 0, 0]
let dz = [0, 0, 0, 0, -1, 1]

while head < queue.count {
    let (z, x, y) = queue[head]
    head += 1
    
    for k in 0..<6 {
        let nz = z + dz[k]
        let nx = x + dx[k]
        let ny = y + dy[k]
        
        if nz < 0 || nz >= H || nx < 0 || nx >= N || ny < 0 || ny >= M { continue }
        if box[nz][nx][ny] != 0 { continue }
        
        box[nz][nx][ny] = 1
        dist[nz][nx][ny] = dist[z][x][y] + 1
        queue.append((nz, nx, ny))
    }
}

var answer = 0
for z in 0..<H {
    for x in 0..<N {
        for y in 0..<M {
            if box[z][x][y] == 0 {
                print(-1)
                exit(0)
            }
            answer = max(answer, dist[z][x][y])
        }
    }
}
print(answer)
