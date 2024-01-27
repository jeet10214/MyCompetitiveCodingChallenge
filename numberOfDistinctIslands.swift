import Foundation

func numOfDistinctIslands(grid: [[Int]]) -> Int {
    let rowCount = grid.count
    let colCount = grid[0].count
    
    var visitedArray = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
    
    var distinctIslandPairs: Set<[[Int]]> = []
    
    for row in 0..<rowCount {
        for col in 0..<colCount {
            if grid[row][col] == 1 && visitedArray[row][col] == 0 {
                let pair = bfs(row: row, col: col, baseRow: row, baseCol: col, pair: [])
                distinctIslandPairs.insert([pair])
            }
        }
    }
    
    func bfs(row: Int, col: Int, baseRow: Int, baseCol: Int, pair: [Int]) -> [Int] {
        let row_ = row
        let col_ = col
        
        visitedArray[row_][col_] = 1
        
        var pair_ = pair
        pair_.append(row_ - baseRow)
        pair_.append(col_ - baseCol)
        
        let neighbours = [
            [row_ + 1, col_],
            [row_ - 1, col_],
            [row_, col_ + 1],
            [row_, col_ - 1]
        ]
        
        for neighbour in neighbours {
            if getCheckedWhetherExists(neighbour) {
                bfs(row: neighbour[0], col: neighbour[1], baseRow: baseRow, baseCol: baseCol, pair: pair_)
            }
        }
        
        return pair_
    }
    
    func getCheckedWhetherExists(_ node: [Int]) -> Bool {
        let row = node[0]
        let col = node[1]
        return row >= 0 && col >= 0 &&
        row < rowCount && col < colCount &&
        grid[row][col] == 1 &&
        visitedArray[row][col] == 0
    }
    
    return distinctIslandPairs.count
}

numOfDistinctIslands(grid: [[1,1,0,0,0], [1,1,0,0,0], [0,0,0,1,1], [0,0,0,1,1]])
