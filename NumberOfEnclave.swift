func numEnclavesOptimised(_ grid: [[Int]]) -> Int {
    let rowCount = grid.count
    let colCount = grid[0].count
    var visitedArray = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
    var nodeQueue: [[Int]] = []
    
    // Combine initialization and assignment
    var newGridArray = grid
    
    // Combine initial queue population loops
    for i in 0..<rowCount {
        for j in 0..<colCount {
            if (i == 0 || i == rowCount - 1 || j == 0 || j == colCount - 1) && newGridArray[i][j] == 1 {
                nodeQueue.append([i, j])
            }
        }
    }
    
    while !nodeQueue.isEmpty {
        let node = nodeQueue.removeFirst()
        let row = node[0]
        let col = node[1]
        
        if visitedArray[row][col] == 0 {
            visitedArray[row][col] = 1
            newGridArray[row][col] = 0
            
            let neighbors = [
                [row + 1, col],
                [row - 1, col],
                [row, col + 1],
                [row, col - 1]
            ]
            
            for neighbor in neighbors {
                if getCheckedWhetherExists(neighbor) {
                    nodeQueue.append(neighbor)
                }
            }
        }
    }
    
    // Check and update visitedArray within the loop
    var enclave = 0
    for row in 0..<rowCount {
        for col in 0..<colCount {
            if newGridArray[row][col] == 1 {
                visitedArray[row][col] = 1
                enclave += 1
            }
        }
    }
    
    func getCheckedWhetherExists(_ node: [Int]) -> Bool {
        let row = node[0]
        let col = node[1]
        return row >= 0 && col >= 0 &&
        row < newGridArray.count && col < newGridArray[0].count &&
        newGridArray[row][col] == 1 &&
        visitedArray[row][col] == 0
    }
    
    return enclave
}
