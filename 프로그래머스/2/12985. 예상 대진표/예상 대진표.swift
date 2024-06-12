import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var answer = 0
    var num = n
    var idx = -1
    var a1 = a
    var b1 = b
    while (num > 0) {
        idx += 1
        num /= 2
    }
  
    for i in 0..<idx {
        answer += 1
        if (a1 % 2 == 1) {
            a1 += 1
        }
        if (b1 % 2 == 1) {
            b1 += 1
        }
        print(a1, b1)
        if (a1 == b1) {
            break
        }
        a1 /= 2
        b1 /= 2
    }

    

    return answer
}