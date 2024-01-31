func isBipartitegraph(vertexs: [[Int]], n: Int) -> Bool {
    
    // Creating Bidirectional Graph
    var graph = Array(repeating: Array<Int>(), count: n + 1)
    for edges in vertexs {
        graph[edges[0]] += [edges[1]]
        graph[edges[1]] += [edges[0]]
    }
    
    for i in 1..<graph.count {
        debugPrint(" \(i) -> \(graph[i])")
    }
    
    var colorArray: [Int] = Array(repeating: -1, count: n + 1)
    
    func check(start: Int) -> Bool {
        var queue: [Int] = []
        queue.append(start)
        colorArray[start] = 0
        
        while !queue.isEmpty {
            let node = queue[0]
            queue.removeFirst()
            debugPrint("here node \(node)")
            debugPrint("here connections are \(graph[node])")
            for it in graph[node] {
                debugPrint("current connected \(it)")
                if colorArray[it] == -1 {
                    colorArray[it] = colorArray[node] == 0 ? 1: 0
                    queue.insert(it, at: 0)
                } else if colorArray[it] == colorArray[node] {
                    return false
                }
            }
        }
        return true
    }
    
    for i in 1...n {
        if colorArray[i] == -1 {
            if check(start: i) == false {
                return false
            }
        }
    }
    
    return true
}


isBipartitegraph(vertexs: [[1,2,3],[0,2],[0,1,3],[0,2]], n: 3) // false
isBipartitegraph(vertexs: [[1,3],[0,2],[1,3],[0,2]], n: 3) // true

//isBipartitegraph(vertexs: [[1,2], [2,3], [3,4], [4,7], [7,8], [4,5], [5,6], [6,2]], n: 8)
