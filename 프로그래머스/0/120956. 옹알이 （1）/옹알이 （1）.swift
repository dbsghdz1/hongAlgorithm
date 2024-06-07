import Foundation

func solution(_ babbling:[String]) -> Int {
    var baby = ["aya", "ye", "woo", "ma"]
    var answer = 0
    for s in babbling {
        var check = false
        var cnt = 0
        for i in 0...3 {
            if s.contains(baby[i]) {
                cnt += baby[i].count
            }
        }
        if cnt == s.count {
            answer += 1
        }
    }
    return answer
}