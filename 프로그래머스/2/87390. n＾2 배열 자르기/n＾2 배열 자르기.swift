import Foundation

func solution(_ n: Int, _ left: Int64, _ right: Int64) -> [Int] {
    var answer: [Int] = []
    
    for idx in Int(left)...Int(right) {
        let row = idx / n
        let col = idx % n
        answer.append(max(row, col) + 1)
    }
    
    return answer
}
