import Foundation

func solution(_ word: String) -> Int {
    let alphabetNum = ["A": 0, "E": 1, "I": 2, "O": 3, "U": 4]
    let dictionNum = [781, 156, 31, 6, 1]
    var result = 0
    for (i, w) in word.enumerated() {
        result += dictionNum[i] * alphabetNum[String(w)]!  
    }
    
    return result + word.length
}