import Foundation

struct MinHeap {
    var heap = [(Int, Int)]()

    mutating func push(_ x: (Int, Int)) {
        heap.append(x)
        var i = heap.count - 1
        while i > 0 {
            let p = (i - 1) / 2

            if heap[p].0 < heap[i].0 { break }
            if heap[p].0 == heap[i].0 && heap[p].1 <= heap[i].1 { break }

            heap.swapAt(p, i)
            i = p
        }
    }

    mutating func pop() -> Int? {
        if heap.isEmpty { return nil }
        if heap.count == 1 { return heap.removeLast().1 }

        let ret = heap[0].1
        heap[0] = heap.removeLast()
        var i = 0

        while true {
            let l = 2*i + 1
            let r = 2*i + 2
            var s = i

            if l < heap.count {
                if heap[l].0 < heap[s].0 || (heap[l].0 == heap[s].0 && heap[l].1 < heap[s].1) {
                    s = l
                }
            }

            if r < heap.count {
                if heap[r].0 < heap[s].0 || (heap[r].0 == heap[s].0 && heap[r].1 < heap[s].1) {
                    s = r
                }
            }

            if s == i { break }
            heap.swapAt(i, s)
            i = s
        }

        return ret
    }
}

let N = Int(readLine()!)!
var h = MinHeap()

for _ in 0..<N {
    let x = Int(readLine()!)!
    if x == 0 {
        print(h.pop() ?? 0)
    } else {
        h.push((abs(x), x))
    }
}