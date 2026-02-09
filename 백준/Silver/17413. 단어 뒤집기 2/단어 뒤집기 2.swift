let input = readLine()!

var buffer: [Character] = []
var answer = ""
var isTag = false

func flush(reverse: Bool) {
    if reverse {
        answer += String(buffer.reversed())
    } else {
        answer += String(buffer)
    }
    buffer.removeAll()
}

for ch in input {
    if ch == "<" {
        isTag = true
        if !buffer.isEmpty {
            flush(reverse: isTag)
        }
        buffer.append(ch)
    } else if ch == ">" {
        isTag = false
        buffer.append(ch)
        flush(reverse: isTag)
    } else if ch == " " && !isTag {
        flush(reverse: true)
        answer.append(" ")
    } else { buffer.append(ch) }
}

if !buffer.isEmpty {
    flush(reverse: !isTag)
}

print(answer)