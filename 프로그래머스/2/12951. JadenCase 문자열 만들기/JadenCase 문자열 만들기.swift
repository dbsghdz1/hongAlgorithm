func solution(_ s:String) -> String {
    var lowCase = Array(s.lowercased())
    var idx = 0
    if lowCase[idx].isLetter {
        lowCase[idx] = Character(String(lowCase[idx].uppercased()))
    }
    for i in lowCase {
        if (idx + 1 < lowCase.count && lowCase[idx + 1].isLetter && i == " ") {
            lowCase[idx + 1] = Character(String(lowCase[idx + 1]).uppercased())
        }
        idx += 1
    }
    
    return String(lowCase)
}