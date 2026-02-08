while true {
    let first = readLine()!.split(separator: " ").map { Int($0)! }
    let L = first[0]
    let R = first[1]
    let C = first[2]
    
    if L == 0 && R == 0 && C == 0 { break }

    var building = Array(repeating: Array(repeating: Array(repeating: Character(" "), count: C),count: R),count: L)
    var dist = Array(repeating: Array(repeating: Array(repeating: -1, count: C),count: R),count: L)
    var e = (0, 0, 0)
    var queue: [(Int, Int, Int)] = []
    for l in 0..<L {
        for r in 0..<R {
            let line = Array(readLine()!)
            for c in 0..<C {
                building[l][r][c] = line[c]
                
                if line[c] == "S" {
                    dist[l][r][c] = 0
                    queue = [(l, r, c)]
                }
                
                if line[c] == "E" {
                    e = (l, r, c)
                }
            }
        }
        _ = readLine()
    }
    
    let dx = [-1, 1, 0, 0, 0, 0]
    let dy = [0, 0, -1, 1, 0, 0]
    let dz = [0, 0, 0, 0, -1, 1]
    
    var head = 0
    var isEscape = false
    
    while head < queue.count {
        let (z, x, y) = queue[head]
        head += 1
        
        if z == e.0 && x == e.1 && y == e.2 {
            print("Escaped in \(dist[z][x][y]) minute(s).")
            isEscape = true
            break
        }
        
        for k in 0..<6 {
            let nz = z + dz[k]
            let nx = x + dx[k]
            let ny = y + dy[k]
            
            if nz < 0 || nx < 0 || ny < 0 || nz >= L || nx >= R || ny >= C { continue }
            if dist[nz][nx][ny] != -1 { continue }
            if building[nz][nx][ny] == "#" { continue }
            
            dist[nz][nx][ny] = dist[z][x][y] + 1
            queue.append((nz, nx, ny))
        }
    }
    
    if !isEscape { print("Trapped!") }
}