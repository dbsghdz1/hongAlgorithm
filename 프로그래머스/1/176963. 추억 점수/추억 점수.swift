import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var dict: [String : Int] = [:]
    var answer = [Int]()
    for i in 0..<name.count {
        dict[name[i]] = yearning[i]
    }
    
    for i in photo {
        var sum = 0
        for j in i {
            if dict[j] != nil {
                sum += dict[j]!
            }
        }
        answer.append(sum)
    }
    return answer
}