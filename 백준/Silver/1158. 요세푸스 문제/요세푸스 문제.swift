let nk = readLine()!.split(separator: " ").map { Int($0)! }
let N = nk[0]
let K = nk[1]

var arr = [Int]()
for i in 0..<N {
    arr.append(i + 1)
}

var answer = [Int]()
var head = 0
var c = 1

while answer.count != N {
    if arr.count == head {
        head = 0
    }
    
    if c == K {
        answer.append(arr[head])
        arr.remove(at: head)
        c = 1
    } else {
        c += 1
        head += 1
    }
}

let output = "<" + answer.map { String($0) }.joined(separator: ", ") + ">"
print(output)