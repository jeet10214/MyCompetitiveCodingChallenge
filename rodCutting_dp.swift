//MARK: Recursion + Memoization
//Top to Bottom Approach

func rodCutting(prices: [Int], length: Int) -> Int {
    
    var dp = Array(repeating: Array(repeating: -1, count: length + 1), count: prices.count)
    
    func recursion(ind: Int, currLenghtLeft: Int) -> Int {
        
        if ind == 0 {
            return currLenghtLeft * prices[0]
        }
        
        if dp[ind][currLenghtLeft] != -1 {
            return dp[ind][currLenghtLeft]
        }
        
        let notTake = 0 + recursion(ind: ind - 1, currLenghtLeft: currLenghtLeft)
        var take = 0
        var length = ind + 1
        if length <= currLenghtLeft {
            take = prices[ind] + recursion(ind: ind, currLenghtLeft: currLenghtLeft - length)
        }
        
        dp[ind][currLenghtLeft] = max(notTake, take)
        
        return max(notTake, take)
        
    }
    
    return recursion(ind: prices.count - 1, currLenghtLeft: length)
    
}

rodCutting(prices: [2,5,7,8,10], length: 5)
