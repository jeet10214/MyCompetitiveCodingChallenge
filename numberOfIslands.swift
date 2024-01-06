func numIslands(_ grid: [[Character]]) -> Int {
    
    // Visited Node Array
    var visitedArray = Array(repeating: Array(repeating: "0", count: grid[0].count), count: grid.count)
    
    //queue
    var nodeQueue: [[Int]] = []
    var islandsCount = 0
    
    for row in 0..<grid.count {
        for col in 0..<grid[0].count {
            if visitedArray[row][col] == "0" && grid[row][col] == "1" {
                islandsCount += 1
                breathFirstSearch(row: row, col: col)
            }
        }
    }
    
    func breathFirstSearch(row: Int, col: Int) {
        visitedArray[row][col] = "1"
        
        nodeQueue.append([row, col])
        
        while !nodeQueue.isEmpty {
            
            let row_ = nodeQueue[0][0]
            let col_ = nodeQueue[0][1]
            
            nodeQueue.remove(at: 0)
            
            for boundryRow in -1...1 {
                for boundryCol in -1...1 {
                    let connectNodeRow = row_ + boundryRow
                    let connectNodeCol = col_ + boundryCol
                    if connectNodeRow >= 0 && connectNodeCol >= 0 &&
                        connectNodeRow < grid.count && connectNodeCol < grid[0].count &&
                        grid[connectNodeRow][connectNodeCol] == "1" &&
                        visitedArray[connectNodeRow][connectNodeCol] == "0" {
                        
                        visitedArray[connectNodeRow][connectNodeCol] = "1"
                        debugPrint("new node row \(connectNodeRow) and col \(connectNodeCol)")
                        nodeQueue.append([connectNodeRow, connectNodeCol])
                    }
                }
            }
        }
    }
    return islandsCount
}

//numIslands([["0","1"],["1","0"],["1","1"],["1","0"]])
//numIslands([["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]])
numIslands([["0","1","0"],["1","0","1"],["0","1","0"]])

// [0, 1]
// [1,0]
// [1,1]
// [1,0]


//[0,1,0]
//[1,0,1]
//[0,1,0]


func numIslandsLeetCode(_ grid: [[Character]]) -> Int {
    
    // Visited Node Array
    var visitedArray = Array(repeating: Array(repeating: "0", count: grid[0].count), count: grid.count)
    
    //queue
    var nodeQueue: [[Int]] = []
    var islandsCount = 0
    
    for row in 0..<grid.count {
        for col in 0..<grid[0].count {
            if visitedArray[row][col] == "0" && grid[row][col] == "1" {
                islandsCount += 1
                breathFirstSearch(row: row, col: col)
            }
        }
    }
    
    func breathFirstSearch(row: Int, col: Int) {
        visitedArray[row][col] = "1"
        
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
                    visitedArray[neighbor[0]][neighbor[1]] = "1"
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
        grid[row][col] == "1" &&
        visitedArray[row][col] == "0"
    }
    
    return islandsCount
}

//numIslandsLeetCode([["0","1","0"],["1","0","1"],["0","1","0"]])
numIslandsLeetCode([["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]])
