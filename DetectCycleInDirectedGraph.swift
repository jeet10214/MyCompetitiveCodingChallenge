func detectCycle(adj: [[Int]], n: Int) -> Bool {
    
    var visitedArray: [Int] = Array(repeating: 0, count: n + 1)
    var pathVisited: [Int] = Array(repeating: 0, count: n + 1)
    
    func dfs(node: Int) -> Bool {
        visitedArray[node] = 1
        pathVisited[node] = 1
        
        for connectedNode in adj[node] {
            
            if visitedArray[connectedNode] == 0 {
                if dfs(node: connectedNode) {
                    return true
                }
            } else if pathVisited[connectedNode] == 1 {
                return true
            }
        }
        
        pathVisited[node] = 0
        
        return false
    }
    
    for i in 0..<n {
        if visitedArray[i] == 0 {
            if dfs(node: visitedArray[i]) {
                return true
            }
        }
    }
    
    return false
}
