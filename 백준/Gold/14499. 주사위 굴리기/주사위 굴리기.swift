import Foundation

let first = readLine()!.split(separator: " ").map { Int($0)! }
let N = first[0]
let M = first[1]
var x = first[2]
var y = first[3]
let K = first[4]

var map = [[Int]]()

for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(row)
}

let commands = readLine()!.split(separator: " ").map { Int($0)! }
//위 - 0, 동 - 1, 서 - 2, 북 - 3, 남 - 4, 아래 -5
var dice = [0, 0, 0, 0, 0, 0]
var dx = [0, 0, -1, 1]
var dy = [1, -1, 0, 0]

for c in commands {
    
    if c == 1 && y + 1 < M {
        y += 1
        let d = dice
        dice[1] = d[0]
        dice[0] = d[2]
        dice[2] = d[5]
        dice[5] = d[1]
        
        if map[x][y] == 0 {
            map[x][y] = dice[5]
        } else {
            dice[5] = map[x][y]
            map[x][y] = 0
        }
        print(dice[0])
        
    } else if c == 2 && y - 1 >= 0 {
        y -= 1
        let d = dice
        dice[0] = d[1]
        dice[2] = d[0]
        dice[5] = d[2]
        dice[1] = d[5]
        
        if map[x][y] == 0 {
            map[x][y] = dice[5]
        } else {
            dice[5] = map[x][y]
            map[x][y] = 0
        }
        print(dice[0])
        
    } else if c == 3 && x - 1 >= 0 {
        x -= 1
        let d = dice
        dice[0] = d[4]
        dice[3] = d[0]
        dice[5] = d[3]
        dice[4] = d[5]
        
        if map[x][y] == 0 {
            map[x][y] = dice[5]
        } else {
            dice[5] = map[x][y]
            map[x][y] = 0
        }
        print(dice[0])
        
    } else if c == 4 && x + 1 < N {
        x += 1
        let d = dice
        dice[4] = d[0]
        dice[0] = d[3]
        dice[5] = d[4]
        dice[3] = d[5]
        
        if map[x][y] == 0 {
            map[x][y] = dice[5]
        } else {
            dice[5] = map[x][y]
            map[x][y] = 0
        }
        print(dice[0])
    }
}