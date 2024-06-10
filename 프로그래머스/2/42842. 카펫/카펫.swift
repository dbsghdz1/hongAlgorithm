import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let k = yellow + brown
    for i in 1...k {
        if (k % i == 0 && i > 1) {
            let div1 = k / i
            if ((div1 - 2) * (i - 2) == yellow) {
                return [div1, i]
            }
        }
    }
    return [9]
}