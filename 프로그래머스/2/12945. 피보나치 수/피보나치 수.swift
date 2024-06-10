func solution(_ n:Int) -> Int {
    if (n == 0) {
        return 0
    } else if (n == 1) {
        return 1
    }
    var a = 0
    var b = 1
   
    for _ in 2...n {
        let temp = (a + b) % 1234567
        a = b
        b = temp
    }
    return b
}
