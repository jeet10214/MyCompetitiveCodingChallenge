func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
    
    var visitedArray: [Int] = Array(repeating: 0, count: graph.count )
    var pathVisitedArray: [Int] = Array(repeating: 0, count: graph.count )
    
    var eventStateSet: [Int] = []
    var checkNode: [Int] = Array(repeating: 0, count: graph.count)
    
    for i in 0..<graph.count {
        debugPrint(" \(i) -> \(graph[i])")
    }
    
    func dfs(node: Int) -> Bool {
        visitedArray[node] = 1
        pathVisitedArray[node] = 1
        checkNode[node] = 0
        
        for connectedNode in graph[node] {
            if visitedArray[connectedNode] == 0 {
                if dfs(node: connectedNode) {
                    checkNode[node] = 0
                    return true
                }
            } else if pathVisitedArray[connectedNode] == 1 {
                checkNode[node] = 0
                return true
            }
        }
        
        checkNode[node] = 1
        pathVisitedArray[node] = 0
        return false
    }
    
    for i in 0..<graph.count {
        if visitedArray[i] == 0 {
             dfs(node: i)
        }
    }
    
    for (index,i) in checkNode.enumerated() {
        if i == 1 {
            eventStateSet.append(index)
        }
    }
    
    return eventStateSet
}

eventualSafeNodes([[1,2],[2,3],[5],[0],[5],[],[]])
eventualSafeNodes([[1,2,3,4],[1,2],[3,4],[0,4],[]])
