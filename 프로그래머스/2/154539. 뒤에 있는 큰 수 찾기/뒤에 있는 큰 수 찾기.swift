import Foundation

func solution(_ numbers: [Int]) -> [Int] {
    let n = numbers.count
    var answer = Array(repeating: -1, count: n)
    var stack = [Int]()
    
    for i in 0..<n {
        let cur = numbers[i]
        while let lastIdx = stack.last, numbers[lastIdx] < cur {
            stack.removeLast()
            answer[lastIdx] = cur
        }
        stack.append(i)
    }
    
    return answer
}