// problem link: https://leetcode.com/problems/set-matrix-zeroes/submissions/1085646600/

func setZeroes(_ matrix: inout [[Int]]) {
    var row: [Int] = Array(repeating: 0, count: matrix.count)
    var col: [Int] = Array(repeating: 0, count: matrix[0].count)
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            if matrix[i][j] == 0 {
                row[i] = 1
                col[j] = 1
            }
        }
    }
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            if row[i] == 1 || col[j] == 1 {
                matrix[i][j] = 0
            }
        }
    }
}

var array = [[1,1,1],[1,0,1],[1,1,1]]
setZeroes(&array)
