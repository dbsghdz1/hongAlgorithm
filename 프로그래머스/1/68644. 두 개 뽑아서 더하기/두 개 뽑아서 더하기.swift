import Foundation

func solution(_ numbers: [Int]) -> [Int] {
    var set1 = Set<Int>()
    for i in 0..<numbers.count {
        for j in (i + 1)..<numbers.count {
            set1.insert(numbers[i] + numbers[j])
        }
    }
    return Array(set1).sorted()
}