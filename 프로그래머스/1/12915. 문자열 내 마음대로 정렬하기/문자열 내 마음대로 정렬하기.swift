func solution(_ strings:[String], _ n:Int) -> [String] {
    var dict: [Character : [String]] = [:]
    var answer = [String]()
    for i in strings {
       var arr = Array(i)
        var key = arr[n]
        dict[key] = []
    }
    for i in strings {
        var arr = Array(i)
        var key = arr[n]
        print(key, i)
        if var array = dict[key] {
            array.append(i)
            dict[key] = array.sorted()
         }
    }
    print(dict)
    for i in dict.keys.sorted() {
         for j in dict[i]! {
              answer.append(j)
         }
    }
    return answer
}