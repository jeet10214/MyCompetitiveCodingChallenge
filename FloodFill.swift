func floodFill(_ image:[[Int]], sr: Int, sc:Int, color: Int) -> [[Int]] {
    
    var grid = image
    // Visited Node Array
    var visitedArray = Array(repeating: Array(repeating: 0, count: grid[0].count), count: grid.count)
    var initialColor = grid[sr][sc]
    //queue
    var nodeQueue: [[Int]] = []
    
    breathFirstSearch(row: sr, col: sc)
    
    func breathFirstSearch(row: Int, col: Int) {
        visitedArray[row][col] = 1
        grid[row][col] = color
        nodeQueue.append([row, col])
        
        while !nodeQueue.isEmpty {
            
            let row_ = nodeQueue[0][0]
            let col_ = nodeQueue[0][1]
            
            nodeQueue.remove(at: 0)
            let neighbors = [
                [row_ + 1, col_],
                [row_ - 1, col_],
                [row_, col_ + 1],
                [row_, col_ - 1]
            ]
            
            for neighbor in neighbors {
                if getCheckedWhetherExists(neighbor) {
                    visitedArray[neighbor[0]][neighbor[1]] = 1
                    grid[neighbor[0]][neighbor[1]] = color
                    nodeQueue.append(neighbor)
                }
            }
        }
    }
    
    func getCheckedWhetherExists(_ node: [Int]) -> Bool {
        let row = node[0]
        let col = node[1]
        return row >= 0 && col >= 0 &&
        row < grid.count && col < grid[0].count &&
        grid[row][col] == initialColor &&
        visitedArray[row][col] == 0
    }
    
    return grid
}

//floodFill(grid, sr: 2, sc: 0, color: 3)
floodFill([[1,1,1], [1,1,0],[1,0,1]], sr: 1, sc: 1, color: 2)
