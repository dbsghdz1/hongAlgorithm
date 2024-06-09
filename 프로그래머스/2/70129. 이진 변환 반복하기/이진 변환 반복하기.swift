import Foundation

func solution(_ s:String) -> [Int] {
    var str = Array(s)
    var idx = 0
    var removeZero = 0
    var arr = ""
    var cnt = 0
    while (str.count > 1) {
        if str[idx] == "0" {
            str.remove(at: idx)
            idx -= 1
            removeZero += 1
        }
        if (idx + 1 == str.count) {
            var len = str.count
            arr = ""
            while (len >= 1) {
                var num = len % 2
                arr += String(num)
                len = len / 2
            }
            str = Array(arr)
            str.reverse()
            cnt += 1
            idx = 0
        }
        idx += 1
    }
    return [cnt, removeZero]
}
