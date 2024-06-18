import Foundation

func solution(_ citations: [Int]) -> Int {
    let sortedCitations = citations.sorted(by: >)
    var hIndex = 0

    for (index, citation) in sortedCitations.enumerated() {
        if citation >= index + 1 {
            hIndex = index + 1
        } else {
            break
        }
    }
    return hIndex
}
