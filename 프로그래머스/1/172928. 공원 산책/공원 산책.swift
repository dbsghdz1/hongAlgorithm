import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    var w = 0
    var h = 0
    var block: [Int] = []
    var start: [Int] = []
    var map: [[Int]] = [[]]
    for i in park {
        w = 0
        for j in i {
            if (j == "S") {
                start.append(h)
                start.append(w)
                map.append([h, w])
            } else if (j == "X") {
                block.append(w)
                block.append(h)
            } else {
                map.append([h, w])
            }
            w += 1
        }
        h += 1
    }
    print(map)
    w -= 1
    h -= 1
    var move: [String] = []
    for i in routes {
        for j in i {
            if (j != " ") {
                if (j.isNumber) {
                    move.append(String(j))
                } else {
                    move.append(String(j))
                }
            }
        }
        start = check(move, start, w, h, map)
        print(start)
        move = []
    }
    return start
}
 
func check(_ move: [String], _ start1: [Int], _ w: Int, _ h: Int, _ map: [[Int]]) -> [Int] {
    var start = start1
    var idx = 0
    var check = true
    var newStart = start
    if (String(move[0]) == "E") {
        while (idx < Int(String(move[1]))!) {
            newStart[1] += 1
            if (newStart[1] > w) {
                check = false
                break
            } else if (!map.contains(newStart)){
                check = false
                break
            }
            idx += 1
        }
        if (check) {
            start = newStart
            return start
        } else {
            return start
        }
    } else if (String(move[0]) == "W") {
        while (idx < Int(String(move[1]))!) {
            newStart[1] -= 1
            if (newStart[1] < 0) {
                check = false
                break
            } else if (!map.contains(newStart)){
                check = false
                break
            }
            idx += 1
        }
        if (check) {
            start = newStart
            return start
        } else {
            return start
        }
    } else if (String(move[0]) == "N") {
        while (idx < Int(String(move[1]))!) {
            newStart[0] -= 1
            if (newStart[0] < 0) {
                check = false
                break
            } else if (!map.contains(newStart)){
                check = false
                break
            }
            idx += 1
        }
        if (check) {
            start = newStart
            return start
        } else {
            return start
        }
    } else if (String(move[0]) == "S") {
        while (idx < Int(String(move[1]))!) {
            newStart[0] += 1
            if (newStart[0] > h) {
                check = false
                break
            } else if (!map.contains(newStart)){
                check = false
                break
            }
            idx += 1
        }
        if (check) {
            start = newStart
            return start
        } else {
            return start
        }
    }
    return start1
}

