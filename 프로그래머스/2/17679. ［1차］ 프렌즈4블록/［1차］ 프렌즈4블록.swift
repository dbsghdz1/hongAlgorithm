    func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
        let dx = [1, 0, 1]
        let dy = [0, 1, 1]
        var answer = 0

        var gameBoard = board.map { Array($0) }
        while true {
            var delBlock = [(Int, Int)]()
            var breakFlag = true

            for x in 0..<m {
                for y in 0..<n {
                    if gameBoard[x][y] == " " { continue } 
                    let t = String(gameBoard[x][y])
                    var flag = true
                    for k in 0..<3 {
                        let nx = x + dx[k]
                        let ny = y + dy[k]

                        if nx >= m || ny >= n {
                            flag = false
                            break
                        }
                        if String(gameBoard[nx][ny]) != String(t) || gameBoard[nx][ny] == " " {
                            flag = false
                            break
                        }
                    }

                    if flag {
                        for k in 0..<3 {
                            let nx = x + dx[k]
                            let ny = y + dy[k]

                            delBlock.append((nx, ny))
                        }
                        delBlock.append((x, y))
                        breakFlag = false
                    }
                }
            }

            if breakFlag {
                break
            }

            for b in delBlock {
                let x = b.0
                let y = b.1
                if gameBoard[x][y] != " " {
                    gameBoard[x][y] = " "
                    answer += 1
                }
            }

        for y in 0..<n {
            var stack = [Character]()
            for x in 0..<m {
                if gameBoard[x][y] != " " {
                    stack.append(gameBoard[x][y])
                }
            }
            var idx = m - 1
            for ch in stack.reversed() {
                gameBoard[idx][y] = ch
                idx -= 1
            }
            
            while idx >= 0 {
                gameBoard[idx][y] = " "
                idx -= 1
            }
        }

            // print(gameBoard)
            // break
        }
        return answer
    }