import Foundation

// 테스트 케이스 개수 입력
let T = Int(readLine()!)!

for _ in 0..<T {
    // 각 테스트 케이스 입력
    let input = readLine()!.components(separatedBy: " ")
    let R = Int(input[0])!
    let S = input[1]
    
    // 결과 문자열을 저장할 변수
    var result = ""
    
    // 문자열의 각 문자를 R번 반복하여 결과 문자열에 추가
    for char in S {
        for _ in 0..<R {
            result += String(char)
        }
    }
    
    // 결과 출력
    print(result)
}
