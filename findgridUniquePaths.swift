func findUniquePath(row: Int, col: Int) -> Int {
    var dp = Array(repeating: Array(repeating: -1, count: col), count: row)
    func recursion(row_: Int, col_: Int) -> Int {
        if row_ == 0 && col_ == 0 {
            return 1
        }
        
        if row_ < 0 || col_ < 0 {
            return 0
        }
        
        if dp[row_][col_] != -1 { return dp[row_][col_] }
        
        var up = recursion(row_: row_ - 1, col_: col_)
        var left = recursion(row_: row_, col_: col_ - 1)
        dp[row_][col_] = up + left
        return up + left
    }
    
    return recursion(row_: row-1, col_: col-1)
}

findUniquePath(row: 4, col: 5)

func findUniquePathTab(row: Int, col: Int) -> Int {
    var dp = Array(repeating: Array(repeating: 0, count: col), count: row)
    
    for row_ in 0..<row {
        for col_ in 0..<col {
            if row_ == 0 && col_ == 0 {
                dp[0][0] = 1
            } else {
                
                var up = row_ - 1 >= 0 ? dp[row_ - 1][col_] : 0
                var left = col_ - 1 >= 0 ? dp[row_][col_ - 1] : 0
                
                dp[row_][col_] = up + left
            }
        }
    }
    
    return dp[row-1][col-1]
}

findUniquePathTab(row: 4, col: 5)
