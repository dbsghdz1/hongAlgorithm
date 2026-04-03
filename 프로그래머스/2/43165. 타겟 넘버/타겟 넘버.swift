import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0
    
    func dfs(_ index: Int, _ sum: Int) {
        if index == numbers.count {
            if sum == target {
                count += 1
            }
            return 
        }
        dfs(index + 1, sum + numbers[index])
        dfs(index + 1, sum - numbers[index])
        
    }
    dfs(0, 0)
    return count
}