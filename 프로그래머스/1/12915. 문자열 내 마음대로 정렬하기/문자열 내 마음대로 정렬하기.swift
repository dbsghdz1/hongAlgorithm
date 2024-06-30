func solution(_ strings:[String], _ n:Int) -> [String] {
    var dict: [Character : String] = [:]
    for i in strings {
        var arr = Array(i)
        dict[arr[n]] = i
    }
    print(dict)
    return []
}