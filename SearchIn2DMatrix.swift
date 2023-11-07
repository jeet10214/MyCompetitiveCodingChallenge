func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    var n = matrix.count
    var m = (matrix[0].count)
    var low = 0
    var high = (n * m) - 1
    
    while low <= high {
        var mid = ( low + high ) / 2
        let row = mid / m
        let col = mid % m
        
        if matrix[row][col] == target {
            return true
        } else if matrix[row][col] < target {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    
    return false
}

searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 60)
