import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var answer = [Int]()
    var album = [String: [(Int, Int)]]()
    var albumCnt = [String: Int]()
    
    for i in 0..<plays.count {
        var arr = album[genres[i]] ?? []
        arr.append((plays[i], i))
        album[genres[i]] = arr
        
        var cnt = albumCnt[genres[i]] ?? 0
        cnt += plays[i]
        albumCnt[genres[i]] = cnt
    }
    
    for (key, value) in album {
        album[key] = value.sorted(by: { $0.0 > $1.0 })
    }      
    
    for (k, v) in albumCnt.sorted(by: { $0.value > $1.value}) {
        var cnt = 0
        for (key, value) in album[k]! {
            if cnt == 2 { break }
            answer.append(value)
            cnt += 1
        }
    }
    
    return answer
}