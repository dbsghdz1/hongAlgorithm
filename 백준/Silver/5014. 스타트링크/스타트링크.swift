let input = readLine()!.split(separator: " ").map { Int($0)! }

let F = input[0] //총 층수
let S = input[1] //현재 있는 곳
let G = input[2] //가야하는 곳
let U = input[3] //올라가는 층 수
let D = input[4] //내려가는 층 수

//1 -> 3 -> 5 -> 7 -> 9 -> 11 -> 1
//use the stairs

var queue: [Int] = [S]
var move = [U, D]
var dist = Array(repeating: -1, count: 1000001)
dist[S] = 0
var head = 0
var found = false

while head < queue.count {
    let p = queue[head]
    head += 1
    
    if p == G {
        print(dist[p])
        found = true
        break
    }
    
    let up = p + move[0]
    let dp = p - move[1]
    
    if up <= F && dist[up] == -1 {
        queue.append(up)
        dist[up] = dist[p] + 1
    }
    
    if dp > 0 && dist[dp] == -1 {
        queue.append(dp)
        dist[dp] = dist[p] + 1 
    }
}

if !found {
    print("use the stairs")
}
