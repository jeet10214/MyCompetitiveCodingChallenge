
//MARK: DP 26

// =============================================
//Print longest common subsequence string
// Convert the string to array of characters
// call recursion func with s1.count - 1 and s2.count - 1
/// Inside recursion function
/// add base cases for index < 0 then return ""
/// check for memo[index1][index2] and return  memo[index1][index2] if not equal to ""
/// if s1[index1] == s2[index2] call recursion func with index1-1 and index2-1 and store in memo
///  else call recursion func as recursion(index1: index1-1, index2: index2) and recursion(index1: index1, index2: index2-1) and take the longest string and store in memo

func lcsStr(string1: String, string2: String) {
    var s1 = Array(string1)
    var s2 = Array(string2)
    
    var memo: [[String]] = Array(repeating: Array(repeating: "", count: s2.count + 1), count: s1.count + 1)

    func recursion(index1: Int, index2: Int) -> String {
        if index1 < 0 || index2 < 0 {
            return ""
        }
        
        if memo[index1][index2] != "" {
            return memo[index1][index2]
        }
        
        if s1[index1] == s2[index2] {
            memo[index1][index2] = recursion(index1: index1 - 1, index2: index2 - 1) + String(s1[index1])
            return memo[index1][index2]
        } else {
            let option1 = recursion(index1: index1-1, index2: index2)
            let option2 = recursion(index1: index1, index2: index2-1)
            memo[index1][index2] = option1.count > option2.count ? option1 : option2
            return memo[index1][index2]
        }
    }
    
    recursion(index1: s1.count - 1, index2: s2.count - 1)
}

lcsStr(string1: "abcde", string2: "ace")
