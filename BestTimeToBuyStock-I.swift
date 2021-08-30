func maxProfit(_ prices: [Int]) -> Int {
    guard var min = prices.first else {
        return 0
    }
    var max = min
    var maxProfit = 0
    for day in 0..<prices.count {
        let price = prices[day]
        if price < min {
            min = price
            max = 0
            continue
        }
        if price > max {
            max = price
            let newMaxProfit = max - min
            if newMaxProfit > maxProfit {
                maxProfit = newMaxProfit
            }
            continue
        }
    }
    return maxProfit
}
