func uniquePaths(_ m: Int, _ n: Int) -> Int {
    
    var array: [[Int]] = Array(repeating: Array(repeating: -1, count: n), count: m)
    
    func recursion(row: Int, col: Int) -> Int {
        
        if row >= m || col >= n {
            return 0
        }
        
        if row == m-1 && col == n-1 {
            return 1
        }
        
        if array[row][col] != -1 {
            return array[row][col]
        }
        
        let down = recursion(row: row + 1, col: col)
        let right = recursion(row: row, col: col + 1)
        
        array[row][col] = down + right
        
        return down + right
    }
    
    return recursion(row: 0, col: 0)
}

uniquePaths(3, 7)
