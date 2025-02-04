import Foundation

var num  = 0
var answer = 0
var inputs: [String] = []
if let count = readLine(),
   let n = Int(count) {
    num = n
    for _ in 0..<n {
        if let line = readLine() {
            inputs.append(line)
        }
    }
}
var check = true
for input in inputs {
    check = true
    var saveWords: [String] = []
    let words = input
    for word in words {
        let checkWord = saveWords.last ?? ""
        if checkWord != String(word) {
            if saveWords.contains(String(word)) {
                check = false
            }
        }
        saveWords.append(String(word))
    }
    if check {
        answer += 1
    }
}
print(answer)
