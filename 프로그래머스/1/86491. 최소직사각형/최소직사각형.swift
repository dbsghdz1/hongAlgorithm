import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var idx = 0
    var size = sizes
    var max2:[Int] = []
    for i in size {
        var arr = i
        arr.sort()
        size[idx] = arr
        idx += 1
    }
    for i in 0..<2 {
        var max = 0
        for j in 0..<size.count {
            if max < size[j][i] {
                max = size[j][i]
            }
        }
        max2.append(max)
    }
    print(size)
    return max2[0] * max2[1]
}