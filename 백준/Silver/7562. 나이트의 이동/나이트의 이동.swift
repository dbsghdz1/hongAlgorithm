import Foundation

let T = Int(readLine()!)!

let dx = [-2, -2, -1, -1, 1, 1, 2, 2]
let dy = [-1,  1, -2,  2,-2, 2,-1, 1]

for _ in 0..<T {
    let L = Int(readLine()!)!
    let start = readLine()!.split(separator: " ").map { Int($0)! }
    let target = readLine()!.split(separator: " ").map { Int($0)! }

    let sx = start[0], sy = start[1]
    let tx = target[0], ty = target[1]

    if sx == tx && sy == ty {
        print(0)
        continue
    }

    var dist = Array(
        repeating: Array(repeating: -1, count: L),
        count: L
    )

    var queue: [(Int, Int)] = []
    var head = 0

    queue.append((sx, sy))
    dist[sx][sy] = 0

    while head < queue.count {
        let (x, y) = queue[head]
        head += 1

        for i in 0..<8 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if nx < 0 || nx >= L || ny < 0 || ny >= L { continue }
            if dist[nx][ny] != -1 { continue }

            dist[nx][ny] = dist[x][y] + 1

            if nx == tx && ny == ty {
                print(dist[nx][ny])
                head = queue.count // BFS 종료
                break
            }

            queue.append((nx, ny))
        }
    }
}