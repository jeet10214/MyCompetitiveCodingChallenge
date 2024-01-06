import Foundation

func orangesRotting(_ grid: [[Int]]) -> Int {
    
    // Visited Node Array
    var visitedArray = Array(repeating: Array(repeating: 0, count: grid[0].count), count: grid.count)
    
    var nodeQueue: [[Int]] = []
    var time: [Int] = []
    
    for row in 0..<grid.count {
        for col in 0..<grid[0].count {
            if grid[row][col] == 2 {
                nodeQueue.append([row, col])
                visitedArray[row][col] = 2
                time.append(0)
            } else {
                visitedArray[row][col] = 0
            }
        }
    }
    var tm = 0
    
    while !nodeQueue.isEmpty {
        var row_ = nodeQueue[0][0]
        var col_ = nodeQueue[0][1]
        
        var visitedTime = time[0]

        tm = max(tm, visitedTime)

        nodeQueue.removeFirst()
        time.removeFirst()

        let neighbors = [
            [row_ + 1, col_],
            [row_ - 1, col_],
            [row_, col_ + 1],
            [row_, col_ - 1]
        ]
        
        for neighbor in neighbors {
            if getCheckedWhetherExists(neighbor) {
                nodeQueue.append(neighbor)
                time.append(visitedTime + 1)
                visitedArray[neighbor[0]][neighbor[1]] = 2
            }
        }
    }
    
    func getCheckedWhetherExists(_ node: [Int]) -> Bool {
        let row = node[0]
        let col = node[1]
        return row >= 0 && col >= 0 &&
        row < grid.count && col < grid[0].count &&
        visitedArray[row][col] != 2 && grid[row][col] == 1
    }
    
    for row in 0..<grid.count {
        for col in 0..<grid[0].count {
            if grid[row][col] == 1 && visitedArray[row][col] != 2 {
                return -1
            }
        }
    }
    
    return tm
}

//orangesRotting([[2,1,1],[1,1,0],[0,1,1]])
orangesRotting([[2,1,1],[0,1,1],[1,0,1]])

