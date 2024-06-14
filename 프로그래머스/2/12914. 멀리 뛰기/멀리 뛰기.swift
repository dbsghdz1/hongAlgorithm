func solution(_ n:Int) -> Int {
     if n <= 3 {
        return n
    }
    var k = 1234567
    var a = 0
    var b = 1
    for _ in 1...n {
        let temp = (a + b) % k
        a = b
        b = temp
    }
    return b
}