import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var answer = 0
    var stack: [Int] = []
    for i in ingredient {
        stack.append(i)
        if (stack.count < 4) {
            continue
        }
        var num = stack.count
        if (Array(stack[num - 4..<num]) == [1,2,3,1]) {
            stack = Array(stack[0..<num-4])
            answer += 1
        }
        
    }
    return answer
}