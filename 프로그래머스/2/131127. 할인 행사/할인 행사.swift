import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var wantArr: [String] = []
    var answer = 0
    var idx = 0
    var index = 0
    for i in number {
        for _ in 0..<i {
            wantArr.append(want[idx])
        }
        idx += 1
    }
    idx = 0
    var cnt = 0
    var range = discount.count - wantArr.count + 1
    print(range)
    for i in 0..<range {
        var dis = discount[i...(wantArr.count - 1 + i)]
        for j in 0..<wantArr.count {
            if dis.contains(wantArr[j]) {
                cnt += 1
                index = dis.firstIndex(of: wantArr[j])!
                dis.remove(at: index)
            }
        }
        if cnt == wantArr.count {
            answer += 1
        }
        cnt = 0
        idx += 1
    }
    
    return answer
}