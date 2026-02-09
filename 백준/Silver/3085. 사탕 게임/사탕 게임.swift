let N = Int(readLine()!)!

var board = Array(repeating: Array(repeating: Character(" "), count: N), count: N)

for i in 0..<N {
    let line = Array(readLine()!)
    for j in 0..<N {
        board[i][j] = line[j]
    }
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
var result = 0

for i in 0..<N {
    for j in 0..<N {
        for k in 0..<4 {
            let nx = i + dx[k]
            let ny = j + dy[k]
            
            if nx < 0 || ny < 0 || nx >= N || ny >= N { continue }
            
            var tempBoard = board
            tempBoard[i][j] = board[nx][ny]
            tempBoard[nx][ny] = board[i][j]

            result = max(result, checkMax(arr: tempBoard))
        }
    }
}

print(result)

func checkMax(arr: [[Character]]) -> Int {
    var maxCount = 0

    for i in 0..<N {
        var count = 1
        for j in 1..<N {
            if arr[i][j] == arr[i][j-1] {
                count += 1
            } else {
                count = 1
            }
            maxCount = max(maxCount, count)
        }
    }

    for j in 0..<N {
        var count = 1
        for i in 1..<N {
            if arr[i][j] == arr[i-1][j] {
                count += 1
            } else {
                count = 1
            }
            maxCount = max(maxCount, count)
        }
    }
    
    return maxCount
}