func solution(_ str1:String, _ str2:String) -> Int {
    var firstArr: [String] = []
    var secondArr: [String] = []
    var firstStr = ""

    for str in str1.lowercased() {
        if let ascii = str.asciiValue {
            if ascii > 96 && ascii < 123 {
                firstStr += String(str)
            } else {
                firstStr = "" 
            }
        }
        
        if firstStr.count == 2 {
            firstArr.append(firstStr)
            firstStr = String(str)
        }
    }
    
    
    firstStr = ""
    for str in str2.lowercased() {
        if let ascii = str.asciiValue {
            if ascii > 96 && ascii < 123 {
                firstStr += String(str)
            } else {
                firstStr = ""
            }
        }
        
        if firstStr.count == 2 {
            secondArr.append(firstStr)
            firstStr = String(str)
        }
    }
    
    var sumArr = Set<String>()
    var sumResult = 0
    if !firstArr.isEmpty && !secondArr.isEmpty {
        sumArr = Set(firstArr + secondArr)
        // sumResult = max(sumArr.count, firstArr.count)
        // sumResult = max(sumResult, secondArr.count)
        for arr in sumArr {
            sumResult += max(secondArr.filter { $0 == arr}.count, firstArr.filter { $0 == arr}.count)
        }
    } else {
            sumResult = max(secondArr.count, firstArr.count)
        }
    var arr2 = [String]()
    
    for arr in firstArr {
        if secondArr.contains(arr) {
            arr2.append(arr)
        }
    }
    
    var setArr2 = Set(arr2)
    var sumResult2 = 0
    
    for arr in setArr2 {
      sumResult2 += min(secondArr.filter { $0 == arr}.count, firstArr.filter { $0 == arr}.count)
    }
    
    if sumResult == 0 {
        return 65536
    } 
    var result = (Double(sumResult2) / Double(sumResult)) * 65536
    return Int(result)
}