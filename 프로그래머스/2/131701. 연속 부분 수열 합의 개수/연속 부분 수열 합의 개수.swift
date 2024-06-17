import Foundation

func solution(_ elements:[Int]) -> Int {
    var a: [Int] = []
    for i in 1...elements.count {
        a += check(elements, i)
    }
    return Set(a).count
}

func check(_ arr: [Int], _ range: Int) -> [Int] {
    var elements = arr
    elements += arr
    var idx = 0
    var result: [Int] = []
    for i in 0..<arr.count {
        var sum = 0
        for j in 0..<range {
            sum += elements[j + idx]
        }
        idx += 1
        result.append(sum)
    }
    return result
}