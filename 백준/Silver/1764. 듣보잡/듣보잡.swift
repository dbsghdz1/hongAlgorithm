let first = readLine()!.split(separator: " ").map { Int($0)! }
let N = first[0]
let M = first[1]

let notHeard = (0..<N).map { _ in readLine()! }
let notSeen = (0..<M).map { _ in readLine()! }
let heardSet = Set(notHeard)
let seenSet = Set(notSeen)

var result = [String]()

for name in heardSet {
    if seenSet.contains(name) {
        result.append(name)
    }
}

print(result.count)
for name in result.sorted() {
    print(name)
}