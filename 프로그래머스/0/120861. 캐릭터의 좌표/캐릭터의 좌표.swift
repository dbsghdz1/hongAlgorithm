import Foundation

func solution(_ keyinput:[String], _ board:[Int]) -> [Int] {
    var answer: [Int] = [0, 0]
    let hlen = board[0] / 2
    let vlen = board[1] / 2
    
    for key in keyinput {
        
        if key == "left" {
            if answer[0] - 1 < -hlen { continue }
            answer[0] -= 1
        } else if key == "right" {
            if answer[0] + 1 > hlen { continue }
            answer[0] += 1
        } else if key == "up" {
            if answer[1] + 1 > vlen { continue }
            answer[1] += 1
        } else {
            if answer[1] - 1 < -vlen { continue }
            answer[1] -= 1
        }
    }
    return answer
}