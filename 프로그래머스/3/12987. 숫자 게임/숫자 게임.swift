import Foundation

//음 쉬운데 그냥 A 정렬하고 하나 씩 탐색하면서 왜냐면 기링가 100,000 이하니깐
//B의 중간인덱스 저장하면 될 듯
func solution(_ a:[Int], _ b:[Int]) -> Int {
    let sortedA = a.sorted()
    let sortedB = b.sorted()
    
    var answer = 0
    var index = 0
    for i in sortedA {
        if index < b.count {
        for j in index..<b.count {
            if i < sortedB[j] {
                answer += 1
                index = j + 1
                break
            }
        }
        }
    }
    return answer
}