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

        let ret = heap[0]
        heap[0] = heap.removeLast()
        var i = 0

        while true {
            let l = 2*i + 1
            let r = 2*i + 2
            var s = i

            if l < heap.count && heap[l] > heap[s] { s = l }
            if r < heap.count && heap[r] > heap[s] { s = r }
            if s == i { break }

            heap.swapAt(i, s)
            i = s
        }
        return ret
    }

    func max() -> Int? { heap.first }
    func count() -> Int { heap.count }
    func isEmpty() -> Bool { heap.isEmpty }
}

struct MinHeap {
    var heap = [Int]()

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
        if heap.isEmpty { return nil }
        if heap.count == 1 { return heap.removeLast() }

        let ret = heap[0]
        heap[0] = heap.removeLast()
        var i = 0

        while true {
            let l = 2*i + 1
            let r = 2*i + 2
            var s = i

            if l < heap.count && heap[l] < heap[s] { s = l }
            if r < heap.count && heap[r] < heap[s] { s = r }
            if s == i { break }

            heap.swapAt(i, s)
            i = s
        }
        return ret
    }

    func min() -> Int? { heap.first }
    func count() -> Int { heap.count }
    func isEmpty() -> Bool { heap.isEmpty }
}

let n = Int(readLine()!)!
var maxh = MaxHeap()
var minh = MinHeap()

var output = ""
//output.reserveCapacity(n * 3)

for _ in 0..<n {
    let x = Int(readLine()!)!

    if maxh.count() == minh.count() {
        maxh.push(x)
    } else {
        minh.push(x)
    }

    if !minh.isEmpty(),
       let leftTop = maxh.max(),
       let rightTop = minh.min(),
       leftTop > rightTop {

        let a = maxh.pop()!
        let b = minh.pop()!
        maxh.push(b)
        minh.push(a)
    }

    output += "\(maxh.max()!)\n"
}

print(output, terminator: "")