
func topologicalSort(_ graph: [[Int]]) -> [Int] {
    
    var visitedArray: [Int] = Array(repeating: 0, count: graph.count )
    var stack: [Int] = []
    
    for i in 0..<graph.count {
        debugPrint(" \(i) -> \(graph[i])")
    }
    
    func dfs(node: Int) {
        visitedArray[node] = 1
        
        for connectedNode in graph[node] {
            if visitedArray[connectedNode] == 0 {
                dfs(node: connectedNode)
            }
        }
        
        stack.append(node)
        return
    }
    
    for i in 0..<graph.count {
        if visitedArray[i] == 0 {
             dfs(node: i)
        }
    }
    
    return stack.reversed()
}

topologicalSort([[], [], [3], [1], [0,1], [0,2]])
