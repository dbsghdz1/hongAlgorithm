if let s = readLine() {
    var min = 0
    var last = ""

    for i in s {
        if last != String(i) {
            min += 1
        }
        last = String(i)
    }

    print(min / 2)
}
