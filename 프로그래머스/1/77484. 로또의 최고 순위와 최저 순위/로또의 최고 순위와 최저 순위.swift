import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var min = 7
    var max = 7
    for i in lottos {
        if win_nums.contains(i) {
            max -= 1
            min -= 1
        } else if i == 0 {
            max -= 1
        }
    }
    
    if min == 7 {
        min = 6
    } 
    
    if max == 7 {
        max = 6
    }
    return [max, min]
}