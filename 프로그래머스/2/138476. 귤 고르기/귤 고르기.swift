import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var dict : [Int : Int] = [:]
    var k1 = k
    var answer = 0
    for i in tangerine {
        dict[i, default: 0] += 1
    }
    
    let max = dict.values.sorted(by: >)
    
    for count in max {
        k1 -= count
        answer += 1
        if k1 <= 0 {
            break
        }
    }
    return answer
}