import Foundation

struct MinHeap {
    private var heap: [Int] = []

    var isEmpty: Bool { heap.isEmpty }
    var count: Int { heap.count }
    func peek() -> Int? { heap.first }

    mutating func push(_ x: Int) {
        heap.append(x)
        var i = heap.count - 1

        while i > 0 {
            let p = (i - 1) / 2
            if heap[p] <= heap[i] { break }
            heap.swapAt(p, i)
            i = p
        }
    }

    mutating func pop() -> Int? {
        guard !heap.isEmpty else { return nil }
        if heap.count == 1 { return heap.removeLast() }

        let minValue = heap[0]
        heap[0] = heap.removeLast()
        var i = 0

        while true {
            let l = i * 2 + 1
            let r = i * 2 + 2
            var smallest = i

            if l < heap.count && heap[l] < heap[smallest] {
                smallest = l
            }
            if r < heap.count && heap[r] < heap[smallest] {
                smallest = r
            }
            if smallest == i { break }

            heap.swapAt(i, smallest)
            i = smallest
        }

        return minValue
    }
}

let N = Int(readLine()!)!
var h = MinHeap()

for _ in 0..<N {
    let x = Int(readLine()!)!
    if x == 0 {
        print(h.pop() ?? 0)
    } else {
        h.push(x)
    }
}