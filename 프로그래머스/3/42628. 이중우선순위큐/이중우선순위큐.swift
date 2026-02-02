import Foundation

func solution(_ operations: [String]) -> [Int] {
    var minHeap = Heap(type: true)
    var maxHeap = Heap(type: false)
    var count: [Int: Int] = [:]

    func clean(_ heap: inout Heap) {
        while let top = heap.peek(), (count[top] ?? 0) == 0 {
            _ = heap.pop()
        }
    }

    for op in operations {
        let parts = op.split(separator: " ")
        let cmd = parts[0]

        if cmd == "I" {
            let x = Int(parts[1])!
            minHeap.push(x)
            maxHeap.push(x)
            count[x, default: 0] += 1
        } else { // "D"
            if parts[1] == "1" {
                clean(&maxHeap)
                if let x = maxHeap.pop(), (count[x] ?? 0) > 0 {
                    count[x]! -= 1
                }
            } else { // "-1"
                clean(&minHeap)
                if let x = minHeap.pop(), (count[x] ?? 0) > 0 {
                    count[x]! -= 1
                }
            }
        }
    }

    clean(&minHeap)
    clean(&maxHeap)

    if minHeap.isEmpty || maxHeap.isEmpty {
        return [0, 0]
    }
    return [maxHeap.peek()!, minHeap.peek()!]
}

struct Heap {
    // true: min-heap, false: max-heap
    let isMinHeap: Bool
    var heapMemory: [Int] = []

    init(type: Bool) {
        self.isMinHeap = type
    }

    var isEmpty: Bool { heapMemory.isEmpty }
    func peek() -> Int? { heapMemory.first }

    mutating func push(_ x: Int) {
        heapMemory.append(x)
        siftUp(from: heapMemory.count - 1)
    }

    mutating func pop() -> Int? {
        guard !heapMemory.isEmpty else { return nil }
        if heapMemory.count == 1 { return heapMemory.removeLast() }

        let top = heapMemory[0]
        heapMemory[0] = heapMemory.removeLast()
        siftDown(from: 0)
        return top
    }

    // MARK: - heap helpers

    private func higherPriority(_ a: Int, _ b: Int) -> Bool {
        // minHeap: smaller wins, maxHeap: larger wins
        return isMinHeap ? (a < b) : (a > b)
    }

    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2

        while child > 0 && higherPriority(heapMemory[child], heapMemory[parent]) {
            heapMemory.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    private mutating func siftDown(from index: Int) {
        var parent = index

        while true {
            let left = parent * 2 + 1
            let right = left + 1
            var candidate = parent

            if left < heapMemory.count && higherPriority(heapMemory[left], heapMemory[candidate]) {
                candidate = left
            }
            if right < heapMemory.count && higherPriority(heapMemory[right], heapMemory[candidate]) {
                candidate = right
            }
            if candidate == parent { return }

            heapMemory.swapAt(parent, candidate)
            parent = candidate
        }
    }
}