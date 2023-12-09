func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
    
    var trustCount = Array(repeating: 0, count: n+1)
    for edges in trust {
        trustCount[edges[0]] -= 1
        trustCount[edges[1]] += 1
    }
    
    for i in 1..<trustCount.count {
        if trustCount[i] == n - 1 {
            return i
        }
    }
    
    return -1
}

findJudge(3, [[1,3],[2,3]])
