import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var n1 = [1, 2, 3, 4, 5]
    var n2 = [2, 1, 2, 3, 2, 4, 2, 5]
    var n3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    var idx = 1
    var answer = [0, 0, 0]
    var answer2 = [Int]()
    
    for i in 0..<answers.count {
        if answers[i] == n1[i % n1.count] {
            answer[0] += 1
        }
        if answers[i] == n2[i % n2.count] {
            answer[1] += 1
        }
        if answers[i] == n3[i % n3.count] {
            answer[2] += 1
        }
    }
    for i in answer {
        if i == answer.max() {
            answer2.append(idx)
        }
        idx += 1
    }
    return answer2
}