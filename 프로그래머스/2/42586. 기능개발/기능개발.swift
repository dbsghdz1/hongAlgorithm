func solution(_ progresses: [Int], _ speeds: [Int]) -> [Int] {
    var answer: [Int] = []
    var progresses = progresses
    var speeds = speeds
    
    while !progresses.isEmpty {
        for i in 0..<progresses.count {
            progresses[i] += speeds[i]
        }

        var count = 0
        while !progresses.isEmpty && progresses[0] >= 100 {
            progresses.removeFirst()
            speeds.removeFirst()
            count += 1
        }
    
        if count > 0 {
            answer.append(count)
        }
    }
    
    return answer
}