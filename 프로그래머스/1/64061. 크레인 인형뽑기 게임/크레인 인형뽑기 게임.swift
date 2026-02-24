import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var answer = 0
    var stack = [Int]()
    let n = board.count
    var p = board
    
    for m in moves {
        var pick = false
        var index = m - 1
        for i in 0..<n {
            let doll = p[i][index]
            if doll != 0 {
                pick = true
                
                if !stack.isEmpty {
                    if stack.last == doll {
                        stack.removeLast()
                        answer += 2
                    } else {
                        stack.append(doll)
                    }
                } else {
                    stack.append(doll)
                }
                p[i][index] = 0
            }
            if pick {
                break
            }
        }
    }
    return answer
}