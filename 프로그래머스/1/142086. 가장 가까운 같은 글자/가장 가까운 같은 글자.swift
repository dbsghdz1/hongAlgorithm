import Foundation

func solution(_ s:String) -> [Int] {
    var dict: [Character: Int] = [:]
    var answer = [Int]()
    
    for (i, c) in s.enumerated() {
        if dict[c] == nil {
            answer.append(-1)
            dict[c] = i
        } else {
            answer.append(i - dict[c]!)
            dict[c] = i
        }
    }
    return answer
}