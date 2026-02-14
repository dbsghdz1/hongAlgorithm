import Foundation

struct MaxHeap {
    var heap = [Int]()
    
    mutating func push(_ x: Int) {
        heap.append(x)
        var i = heap.count - 1
        while i > 0 {
            let p = (i - 1) / 2
            if heap[p] >= heap[i] { break }
            heap.swapAt(p, i)
            i = p
        }
    }
    
    mutating func pop() -> Int? {
        if heap.isEmpty { return nil }
        if heap.count == 1 { return heap.removeLast() }
        let max = heap[0]
        heap[0] = heap.removeLast()
        var i = 0
        while true {
            let l = 2 * i + 1
            let r = 2 * i + 2
            var s = i
            if l < heap.count && heap[l] > heap[s] { s = l }
            if r < heap.count && heap[r] > heap[s] { s = r }
            if s == i { break }
            heap.swapAt(i, s)
            i = s
        }
        return max
    }
}

let N = Int(readLine()!)!
var h = MaxHeap()

for _ in 0..<N {
    let x = Int(readLine()!)!
    if x == 0 {
        print(h.pop() ?? 0)
    } else {
        h.push(x)
    }
}