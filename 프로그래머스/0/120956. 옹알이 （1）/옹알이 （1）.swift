import Foundation

func solution(_ babbling:[String]) -> Int {
    let baby = ["aya", "ye", "woo", "ma"]
    var answer = 0
    for i in babbling {
        var spelling = ""
        for j in i {
            spelling += String(j) 
            for i in baby {
                if i == spelling {
                    spelling = ""
                }
            }
        }
        if spelling.isEmpty {
                answer += 1
            }
    }
    return answer
}