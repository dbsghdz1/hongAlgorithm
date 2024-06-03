import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var dict: [String : Int] = [:]
    var flag = true
    var answer: [Int] = []
    var index = 1
    var check = 1
    for s in terms {
        flag = true
        check = 1
        var key: String = ""
        for t in s {
            if (t.isLetter) {
                key = String(t)
                dict[String(t)] = 0
            } else if (s == " ") {
                continue
            } else if (t.isNumber){
                if (flag) {
                    dict[key] = Int(String(t))!
                    flag = false
                } else {
                    dict[key] = Int(String(t))! + (10 * dict[key]!)
                    check *= 10
                }
            }
        }
    }
    print(dict)
    var tday: [Int] = []
    for n in today {
        if (n.isNumber) {
            tday.append(Int(String(n))!)
        }
    }
    var today = tday.reduce(0, { $0 * 10 + $1 })
    var arr1:[Int] = []
    var search = ""
    var value = 0
    for i in privacies {
        arr1 = []
        for s in i {
            if (s.isNumber) {
                arr1.append(Int(String(s))!)
            } else if (s.isLetter && s != ".") {
                search = String(s)
                value = dict[search]!
                arr1[5] += value
            }
        }
        arr1[7] -= 1
        if (arr1[7] == 0 && arr1[6] == 0) {
            arr1[6] = 2
            arr1[7] = 8
            arr1[5] -= 1
        }
        if (arr1[7] == -1) {
            arr1[7] = 9
            arr1[6] -= 1
        }
        value = arr1[4] * 10
        value += arr1[5]
        if (value > 12) {
            if (value % 12 == 0) {
                arr1[3] += value / 12 - 1
                arr1[4] = 1 // 변경 필요
                arr1[5] = 2
            } else {
                arr1[3] += value / 12
                arr1[4] = 0 // 변경 필요
                arr1[5] = value % 12
            }
        }
        if (arr1[5] >= 10) {
            arr1[4] += 1
            arr1[5] -= 10
        }
        
        var idx = 3
        while (idx > 0) {
            if (arr1[idx] >= 10) {
                arr1[idx - 1] += arr1[idx] / 10
                arr1[idx] = arr1[idx] % 10
            }
            idx -= 1
        }
        var result = arr1.reduce(0, { $0 * 10 + $1 })
        print(result, today)
        if (today > result) {
            answer.append(index)
        }
        index += 1
    }
    return answer
}