import Darwin

//MARK: Recursion + Memoization
//Top to Bottom Approach

//29: https://www.youtube.com/watch?v=xPBLEj41rFU&list=PLgUwDviBIf0qUlt5H_kiKYaNSqJ81PMMY&index=30
//Problem Link:  https://www.naukri.com/code360/problems/minimum-insertions-to-make-palindrome_985293?source=youtube&campaign=striver_dp_videos&utm_source=youtube&utm_medium=affiliate&utm_campaign=striver_dp_videos

// MARK: Recursion + Memoization Approach

// Given the input string find the largest palindrome subsequence
// Take the difference: inputStr.count - largetPalindromeSubsequenceStr.count
// Return the difference

func miniMumInsertionsToStringPalindrome(str: String) -> Int {
    
    var s1 = Array(str)
    var s2 = Array(str.reversed())
    
    var memo: [[String]] = Array(repeating: Array(repeating: "", count: s2.count), count: s1.count)
    
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
            let op1 = recursion(index1: index1 - 1, index2: index2)
            let op2 = recursion(index1: index1, index2: index2 - 1)
            
            memo[index1][index2] = op1.count > op2.count ? op1 : op2
            return memo[index1][index2]
        }
    }
    
    let longestPalindromeString = recursion(index1: s1.count - 1, index2: s2.count - 1)
    
    return s1.count - longestPalindromeString.count
}

miniMumInsertionsToStringPalindrome(str: "abca")
miniMumInsertionsToStringPalindrome(str: "abcdefg")
