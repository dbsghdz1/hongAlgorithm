let t = Int(readLine()!)!
var arr: [Int] = []

for _ in 0..<t {
    arr.append(Int(readLine()!)!)
}

for e in arr {
    var dp = Array(repeating: 0, count: e + 1)
    if e >= 1 { dp[1] = 1 }
    if e >= 2 { dp[2] = 2 }
    if e >= 3 { dp[3] = 4 }
    if e >= 4 {
        for i in 4...e {
           dp[i] = dp[i-2] + dp[i-1] + dp[i-3]
        }
    }
    print(dp[e])
}