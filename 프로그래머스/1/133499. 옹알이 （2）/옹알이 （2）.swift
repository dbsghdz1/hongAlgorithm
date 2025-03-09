import Foundation

func solution(_ babbling:[String]) -> Int {
    var answer = 0
    let ongal = ["aya", "ye", "woo", "ma"]
    
    for bab in babbling {
        var check = true
        var str = bab

        for ong in ongal {
            str = str.replacingOccurrences(of: ong, with: ong.prefix(1).uppercased())
        }
        
        for s in str {
            if s.isLowercase {
                check = false
                break
            }
        }
        
        var lastSound = ""
        for s in str {
            if lastSound == String(s) {
                print(str)
                check = false
                break
            }
            lastSound = String(s)
        }
        
        if check {
            answer += 1
        }
    }
    
    return answer
}
