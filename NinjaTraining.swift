func ninjaTraining(trainingArray: [[Int]]) -> Int {
    
    var dp = Array(repeating: -1, count: trainingArray.count)
    
    func recursion(index: Int, lastActivityPerformedIndex: Int) -> Int {
        
        // base case
        if index == 0 {
            var maxi = 0
            for i in 0..<trainingArray[0].count {
                if i != lastActivityPerformedIndex {
                    maxi = max(maxi, trainingArray[0][i])
                }
            }
            return maxi
        }
        
        if dp[index] != -1 { return dp[index] }
        
        var maxi = 0
        
        for i in 0..<trainingArray[index].count {
            if i != lastActivityPerformedIndex {
                let value = trainingArray[index][i] + recursion(index: index - 1, lastActivityPerformedIndex: lastActivityPerformedIndex)
                maxi = max(maxi, value)
            }
        }
        dp[index] = maxi
        return maxi
    }
    
    return recursion(index: trainingArray.count - 1, lastActivityPerformedIndex: 3)
}

ninjaTraining(trainingArray: [[1,2,5], [3,1,1], [3,3,3]])

func ninjaTrainingTab(trainingArray: [[Int]]) -> Int {
    
    var dp = Array(repeating: 0, count: trainingArray.count)
    var maxi = 0
    var lastPerformedActivityIndex = 3
    for i in 0..<trainingArray[0].count {
        var value = max(maxi, trainingArray[0][i])
        if value > maxi {
            lastPerformedActivityIndex = i
            maxi = value
        }
    }
    
    dp[0] = maxi
    for i in 1..<trainingArray.count {
        maxi = 0
        for activityIndex in 0..<trainingArray[i].count {
            if activityIndex != lastPerformedActivityIndex {
                let value = trainingArray[i][activityIndex] + dp[i - 1]
                if value > maxi {
                    maxi = max(maxi, value)
                    lastPerformedActivityIndex = activityIndex
                }
            }
        }
        dp[i] = maxi
    }
    
    return dp[trainingArray.count - 1]
}

ninjaTrainingTab(trainingArray: [[10,40,40], [20,50,80], [30,60,90]])
