import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var answer = [Int]()
    
    var p = progresses
    var head = 0
    while head < progresses.count {
        var cnt = 0
        var flag = false
        for i in 0..<speeds.count {
            p[i] += speeds[i]
        }
        
        while head < p.count && p[head] >= 100 {
            head += 1
            flag = true
            cnt += 1
        }
        
        if flag { answer.append(cnt) }
        
    }
    return answer
}