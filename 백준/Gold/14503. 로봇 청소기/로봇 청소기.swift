import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let N = nm[0]
let M = nm[1]

let rcd = readLine()!.split(separator: " ").map { Int($0)! }
var r = rcd[0]
var c = rcd[1]
var d = rcd[2]

var map = [[Int]]()

for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(row)
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
let darr = [0, 1, 2, 3]
var answer = 0

while true {
    var flag = false
    if map[r][c] == 0 {
        map[r][c] = 2
        answer += 1
    }
    
    for i in 0..<4 {
        let nx = r + dx[i]
        let ny = c + dy[i]
        
        if nx < 0 || ny < 0 || nx >= N || ny >= M { continue }
        
        if map[nx][ny] == 0 { flag = true }
    }
    
    if flag {
        if d == 0 {
            d = darr[3]
        } else {
            d = darr[d - 1]
        }
        
        var nr = r
        var nc = c
        if d == 0 {
            nr = r - 1
            nc = c
        } else if d == 1 {
            nr = r
            nc = c + 1
        } else if d == 2 {
            nr = r + 1
            nc = c
        } else if d == 3 {
            nr = r 
            nc = c - 1
        }
        
        if nr >= 0 && nc >= 0 && nr < N && nc < M && map[nr][nc] == 0 {
            r = nr
            c = nc
        }
    } else {
        var nr = r
        var nc = c
        if d == 0 {
            nr = r + 1
            nc = c
        } else if d == 1 {
            nr = r
            nc = c - 1
        } else if d == 2 {
            nr = r - 1
            nc = c
        } else if d == 3 {
            nr = r 
            nc = c + 1
        }
        
        if nr < 0 || nc < 0 || nr >= N || nc >= M || map[nr][nc] == 1 {
            break
        } else {
            c = nc
            r = nr
        }
    }
}

print(answer)