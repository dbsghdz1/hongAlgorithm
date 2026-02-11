import Foundation

let first = readLine()!.split(separator: " ").map { Int($0)! }
let N = first[0]
let M = first[1]
var x = first[2]
var y = first[3]
let K = first[4]

var board = [[Int]]()

for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    board.append(row)
}

let commands = readLine()!.split(separator: " ").map { Int($0)! }
//위 - 0, 동 - 1, 서 - 2, 북 - 3, 남 - 4, 아래 -5
var dice = [0, 0, 0, 0, 0, 0]
var dx = [0, 0, -1, 1]
var dy = [1, -1, 0, 0]

for c in commands {
    let nx = x + dx[c-1]
    let ny = y + dy[c-1]

    if nx < 0 || nx >= N || ny < 0 || ny >= M {
        continue
    }

    x = nx
    y = ny
    
    if c == 1 {
        let temp = dice
        dice[0] = temp[2]
        dice[1] = temp[0]
        dice[5] = temp[1]
        dice[2] = temp[5]
    } else if c == 2 {
        let temp = dice
        dice[0] = temp[1]
        dice[2] = temp[0]
        dice[5] = temp[2]
        dice[1] = temp[5]
    } else if c == 3 {
        let temp = dice
        dice[0] = temp[4]
        dice[3] = temp[0]
        dice[5] = temp[3]
        dice[4] = temp[5]
    } else if c == 4 {
        let temp = dice
        dice[0] = temp[3]
        dice[4] = temp[0]
        dice[5] = temp[4]
        dice[3] = temp[5]
    }
    if board[x][y] == 0 {
        board[x][y] = dice[5]   // 바닥 → 칸
    } else {
        dice[5] = board[x][y]   // 칸 → 바닥
        board[x][y] = 0
    }
    print(dice[0])
}