func solution(_ food: [Int]) -> String {
    var answer = [Int]()
    for i in 1..<food.count {
        if food[i] > 1 {
            answer.append(contentsOf: Array(repeating: i, count: food[i] / 2))
        }
    }
    let result = answer + [0] + answer.reversed()
    return result.map { String($0) }.joined()
}