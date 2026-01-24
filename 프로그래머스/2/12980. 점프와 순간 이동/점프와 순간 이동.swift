import Foundation

func solution(_ n:Int) -> Int {
    var goalPoint = n
    var ans = 0
    while (goalPoint != 0) {
        if goalPoint % 2 == 0 {
            goalPoint /= 2
        } else {
            goalPoint -= 1
            ans += 1
        }
    }
    return ans
}