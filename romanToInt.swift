//LINK: https://leetcode.com/problems/roman-to-integer

func romanToInt(_ s: String) -> Int {
    
    let romanDic:[Character: Int] = ["I" : 1, "V" : 5, "X" : 10, "L" : 50, "C" : 100, "D" : 500, "M" : 1000]
    var sum = 0
    var previous = romanDic[s.last!]
    for i in s.reversed() {
        if previous! > romanDic[i]! {
            sum = sum - romanDic[i]!
            previous = romanDic[i]!
            continue
        }
        sum = sum + romanDic[i]!
        previous = romanDic[i]!
    }
    return sum
}
