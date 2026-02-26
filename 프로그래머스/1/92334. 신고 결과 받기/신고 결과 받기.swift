import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var users: [String: [String]] = [:]
    var reports: [String: Int] = [:]
    var block = Set<String>()
    var answerArr = [Int]()
    
    for id in id_list {
        users[id] = []
    }
    
    for r in report {
        let a = r.split(separator: " ")
        let user = String(a[0])
        let target = String(a[1])
        
        var arr = users[user] ?? []
            if !arr.contains(target) {
            arr.append(target)
            users[user] = arr
            let cnt = reports[target] ?? 0
            reports[target] = cnt + 1
        }
    }
    
    for r in reports.keys {
        if reports[r]! >= k {
            block.insert(r)
        }
    }
    
    for id in id_list {
        var answer = 0
        for u in users[id]! {
            if block.contains(u) {
                answer += 1
            }
        }
        answerArr.append(answer)
    }
    
    return answerArr
}