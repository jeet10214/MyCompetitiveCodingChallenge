https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/

func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count > 1 else { return 0 }
    var profit = 0
    for i in 0..<prices.count-1 {
        let diff = prices[i+1] - prices[i]
        if diff > 0 {
            profit += diff
        }
    }
    return profit
}
