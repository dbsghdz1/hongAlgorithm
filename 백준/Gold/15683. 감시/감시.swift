import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let N = nm[0]
let M = nm[1]

var office = Array(repeating: Array(repeating: 0, count: M), count: N)

for i in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 0..<M {
        office[i][j] = row[j]
    }
}

let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]
var cctvs: [(x: Int, y: Int, type: Int)] = []
for i in 0..<N {
    for j in 0..<M {
        let v = office[i][j]
        if v > 0 && v < 6 {
            cctvs.append((i, j, v))
        }
    }
}

let dirsByType: [[[Int]]] = [
    [],
    [[0],[1],[2],[3]],               
    [[0,2],[1,3]],                   
    [[0,1],[1,2],[2,3],[3,0]],        
    [[0,1,2],[1,2,3],[2,3,0],[3,0,1]],
    [[0,1,2,3]]                      
]

func watch(_ board: inout [[Int]], _ x: Int, _ y: Int, _ dir: Int) {
    var nx = x + dx[dir]
    var ny = y + dy[dir]
    while nx >= 0 && ny >= 0 && nx < N && ny < M {
        if board[nx][ny] == 6 { break }
        if board[nx][ny] == 0 { board[nx][ny] = -1 }
        nx += dx[dir]
        ny += dy[dir]
    }
}

func countBlind(_ board: [[Int]]) -> Int {
    var cnt = 0
    for i in 0..<N {
        for j in 0..<M {
            if board[i][j] == 0 { cnt += 1 }
        }
    }
    return cnt
}

var answer = Int.max

func dfs(_ idx: Int, _ board: [[Int]]) {
    if idx == cctvs.count {
        answer = min(answer, countBlind(board))
        return
    }
    
    let (x, y, type) = cctvs[idx]
    
    for option in dirsByType[type] {
        var next = board
        for dir in option {
            watch(&next, x, y, dir)
        }
        dfs(idx + 1, next)
    }
}

dfs(0, office)
print(answer)

