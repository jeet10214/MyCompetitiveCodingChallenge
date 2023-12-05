func makeGraph(vertexs: [[Int]], n: Int) {
    
    var graph = Array(repeating: Array<Int>(), count: n + 1)
    
    for edges in vertexs {
        graph[edges[0]] += [edges[1]]
        graph[edges[1]] += [edges[0]]
    }
    
    for i in 1..<graph.count {
        debugPrint(" \(i) -> \(graph[i])")
    }
}

makeGraph(vertexs: [[1,2], [1,3], [2,4], [3,4], [2,5], [4,5]], n: 5)
