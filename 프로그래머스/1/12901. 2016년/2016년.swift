func solution(_ a:Int, _ b:Int) -> String {
    let cal = [
        1 : 31 , 2 : 29, 3 : 31, 4 : 30, 5 : 31, 6 : 30,
        7 : 31, 8 : 31, 9 : 30, 10 : 31, 11 : 30, 12 : 31
    ]
    
    let day = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    var num = 5
    for i in 1..<a {
        num += cal[i]!
    }
    num += b - 1
    
    return day[num % 7]
}