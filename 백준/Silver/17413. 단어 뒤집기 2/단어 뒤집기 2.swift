let input = readLine()!

var reversedArr: [[Character]] = [[]]
var cArr: [Character] = []
var answer = ""
var flag = false

for i in input {
    if i == ">" {
        cArr.append(i)
        answer += String(cArr)
        cArr = []
        flag = false
        continue
    } else if i == " " && !flag {
        answer += String(cArr.reversed())
        answer += " "
        cArr = []
        continue
    } else if i == "<" {
        flag = true
        if !cArr.isEmpty {
            answer += String(cArr.reversed())
            cArr = []
        }
    } 
    cArr.append(i)
}

if !cArr.isEmpty {
    if flag {
        answer += String(cArr)
    } else {
        answer += String(cArr.reversed())
    }
}

print(answer)
