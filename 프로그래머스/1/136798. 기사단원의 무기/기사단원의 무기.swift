import Foundation

func solution(_ number: Int, _ limit: Int, _ power: Int) -> Int {
    var answer = 0

    for num in 1...number {
        var count = 0
        for i in 1...Int(sqrt(Double(num))) {
            if num % i == 0 {
                count += 1
                if i != num / i {
                    count += 1
                }
            }
        }

        if count > limit {
            answer += power
        } else {
            answer += count
        }
    }
    
    return answer
}
