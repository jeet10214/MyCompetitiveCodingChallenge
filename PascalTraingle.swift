//[1, 5, 10, 10, 5, 1]

// Formula: r C c : (row-1)! / ((c-1)! * (row - col)!)
// ans = ans * (row - col)
// Then ans = ans / col

func pascalTraingle(n: Int) -> [[Int]] {
    var pascalArray: [[Int]] = [[]]
    for i in 1...n {
        pascalArray.append(generatePascalRow(row: i))
    }
    return pascalArray
}

func generatePascalRow(row: Int) -> [Int] {
    var ans = 1
    
    var rowArray: [Int] = []
    rowArray.append(1)
    for col in 1..<row {
        ans = ans * (row - col) // Formula
        ans = ans / col
        rowArray.append(ans)
    }
    
    return rowArray
}

generatePascalRow(row: 6)

pascalTraingle(n: 6)
