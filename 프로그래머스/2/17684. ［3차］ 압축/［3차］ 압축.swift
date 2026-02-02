func solution(_ msg:String) -> [Int] {
    let chars = Array(msg)
    var lastDictNum = 26
    var dict: [String: Int] = [:]
    var answer = [Int]()

    for i in 1...26 {
        let scalar = UnicodeScalar(64 + i)!
        dict[String(scalar)] = i
    }
    
    var i = 0
    
    while i < chars.count {
        var w = String(chars[i])
        var j = i
        
        while j + 1 < chars.count {
            let wc = w + String(chars[j + 1])
            if dict[wc] != nil {
                w = wc
                j += 1
            } else {
                break
            }
        }
        
        answer.append(dict[w]!)
        
        if j + 1 < chars.count {
            let wc = w + String(chars[j + 1])   
            lastDictNum += 1
            dict[wc] = lastDictNum
        }
        i = j + 1
    }
    return answer
}