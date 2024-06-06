func solution(_ id_list: [String], _ report: [String], _ k: Int) -> [Int] {
    var idDict: [String: Int] = [:] // 사용자별 신고 횟수 저장
    var reportDict: [String: Set<String>] = [:] // 사용자가 신고한 사용자 목록 저장
    var reportCountDict: [String: Int] = [:] // 신고당한 횟수 저장
    var answer: [Int] = []

    for i in id_list {
        idDict[i] = 0
    }

    for i in report {
        var arr = i.components(separatedBy: " ")
        var n1 = arr[0]
        var n2 = arr[1]
        
        reportDict[n1, default: []].insert(n2)
    }

    for (n1, n2) in reportDict {
        for n3 in n2 {
            reportCountDict[n3, default: 0] += 1
        }
    }

    for (n1, n2) in reportDict {
        for n3 in n2 {
            if reportCountDict[n3]! >= k {
                idDict[n1]! += 1
            }
        }
    }

    for id in id_list {
        answer.append(idDict[id]!)
    }

    return answer
}
