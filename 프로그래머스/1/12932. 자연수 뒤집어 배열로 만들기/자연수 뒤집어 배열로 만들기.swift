func solution(_ n:Int64) -> [Int] {
	var n1 = Int(n)
    var arr: [Int] = [] //크기를 정하지 않고 생성
    
    while n1 > 0 {
    	arr.append(n1 % 10) //10으로 나눈 나머지를 배열에 추가
        n1 /= 10
    }
    return arr
}