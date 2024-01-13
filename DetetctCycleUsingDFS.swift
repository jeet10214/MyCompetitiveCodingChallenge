import Foundation

func detectCycle(vertexs: [[Int]], n: Int) -> Bool {
    
    var graph = Array(repeating: Array<Int>(), count: n + 1)
    
    var visitedArray: [Int] = Array(repeating: 0, count: n + 1)
    
    for edge in vertexs {
        graph[edge[0]] += [edge[1]]
        graph[edge[1]] += [edge[0]]
    }
    
    for i in 1..<graph.count {
        debugPrint("Node \(i) -> \(graph[i])")
    }
    
    func dfs(node: Int, parentNode: Int) -> Bool {
        
        visitedArray[node] = 1 // marking this as visited
        
        var adjcentNodeArray = graph[node]
        for nodeCon in adjcentNodeArray {
            if visitedArray[nodeCon] == 0 {
                if dfs(node: nodeCon, parentNode: node) {
                    return true
                }
            } else if nodeCon != parentNode {
                return true
            }
        }
        
        return false
    }
    
    for i in 1..<n {
        if visitedArray[i] == 0 {
            if dfs(node: i, parentNode: -1) {
                return true
            }
        }
    }
    
    return false
}

detectCycle(vertexs: [[1,2], [1,3], [3,4], [2,5], [3,6], [5,7], [6,7]], n: 7)
