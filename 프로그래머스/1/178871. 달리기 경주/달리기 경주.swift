import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var p = players
    var dict:[String : Int] = [:]
    players.enumerated().forEach { 
        dict[$0.1] = $0.0
    }
    
    for i in callings {
        var idx = dict[i]!
        dict[i] = dict[i]! - 1
        //[dict[i] = 배열 p에서 추월당한사람의 인덱스 값
        dict[p[dict[i]!]]! += 1
        var idx1 = idx - 1
        p.swapAt(idx, idx1)
    }
    
    return p
}
