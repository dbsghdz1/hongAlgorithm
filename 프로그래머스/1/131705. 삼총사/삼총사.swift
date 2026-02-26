import Foundation

func solution(_ number:[Int]) -> Int {
    var result = 0
    for a in 0..<number.count {
        let aIndex = a + 1
        for b in aIndex..<number.count {
            let bIndex = b + 1
            for c in bIndex..<number.count {
                if number[a] + number[b] + number[c] == 0 { result += 1}
            }
        }
    }
    return result
}