import Darwin

//MARK: Recursion + Memoization
//Top to Bottom Approach

//30: https://www.youtube.com/watch?v=xPBLEj41rFU&list=PLgUwDviBIf0qUlt5H_kiKYaNSqJ81PMMY&index=31
//Problem Link:  https://bit.ly/3pya8CP

// MARK: Approach

// Given the two input string find the largest common subsequence string and store in variable largetSubSeqCount
// Calculate delete operations required on string1: let deletions = strA.count - largetSubSeqCount
// Calculate insert operations required on string2: let insertions = strB.count - largetSubSeqCount
// Return the deletions + insertions

func miniMumInsertionsToConvertStringAToStringB(strA: String, strB: String) -> Int {
    
    var strAArr = Array(strA)
    var strBArr = Array(strB)
    
    var memo: [[String]] = Array(repeating: Array(repeating: "", count: strBArr.count), count: strAArr.count)
    
    func recursion(index1: Int, index2: Int) -> String {
        
        if index1 < 0 || index2 < 0 {
            return ""
        }
        
        if memo[index1][index2] != "" {
            return memo[index1][index2]
        }
        
        if strAArr[index1] == strBArr[index2] {
            memo[index1][index2] = recursion(index1: index1-1, index2: index2-1) + String(strAArr[index1])
            return memo[index1][index2]
        } else {
            let op1 = recursion(index1: index1, index2: index2-1)
            let op2 = recursion(index1: index1-1, index2: index2)
            
            memo[index1][index2] = op1.count > op2.count ? op1 : op2
            return memo[index1][index2]
        }
    }
    
    let longestCommonSubsequenceString = recursion(index1: strAArr.count - 1, index2: strBArr.count - 1)
    
    
    let deletions = strAArr.count - longestCommonSubsequenceString.count
    let insertions = strBArr.count - longestCommonSubsequenceString.count
    
    return deletions + insertions
}

miniMumInsertionsToConvertStringAToStringB(strA: "abcd", strB: "ace")
