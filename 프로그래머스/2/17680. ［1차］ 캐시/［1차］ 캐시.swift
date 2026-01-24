func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cacheData: [String] = []
    var runtime = 0
    
    for city in cities {
        let cityName = city.lowercased()
        if cacheData.count == cacheSize {
            if cacheData.contains(cityName) {
                runtime += 1
                let index = cacheData.firstIndex(of: cityName)!
                cacheData.remove(at: index)
                cacheData.append(cityName)
            } else {
                runtime += 5
                cacheData.append(cityName)
                cacheData.removeFirst()
            }
        } else {
            if cacheData.contains(cityName) {
                runtime += 1
                let index = cacheData.firstIndex(of: cityName)!
                cacheData.remove(at: index)
                cacheData.append(cityName)
                
            } else {
                runtime += 5
                cacheData.append(cityName)
            }
        }
    }
    return runtime 
}