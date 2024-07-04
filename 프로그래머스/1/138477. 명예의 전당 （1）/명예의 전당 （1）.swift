import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var answer = [Int]()
    var top = [Int]()
    for i in score {
        top.append(i)
        top.sort(by: >)
        if top.count >= k {
            answer.append(top[k - 1])
        } else {
            answer.append(top[top.count - 1])
        }
    }
    return answer
}