import Foundation

func findProvince(_ n: Int, _ adj: [[Int]]) -> Int {
    
    var graph = Array(repeating: Array<Int>(), count: n)
    for i in 0..<adj.count {
        for j in 0..<adj[i].count {
            if adj[i][j] == 1 && i != j {
                graph[i] += [j]
                graph[j] += [i]
            }
        }
    }
    
    for i in 0..<graph.count {
        debugPrint(" \(i) -> \(graph[i])")
    }
    
    // Visited Node Array
    var visitedArray = Array(repeating: 0, count: n + 1)
    var provinceCount = 0
    for i in 0..<n {
        // check whether the node has been visited or not
        if visitedArray[i] == 0 {
            provinceCount += 1
            traverseDepth(node: i)
        }
    }
    
    func traverseDepth(node: Int) {
        
        debugPrint("traversed \(node)")
        
        // marking it as visited and removing it from queue
        visitedArray[node] = 1
        
        // fetch the connecting nodes of the visited node
        let connectedNodes = graph[node]
        
        //Run a loop for connected nodes and add it to queue if not visited or not exsist in queue. If already exisits then ignore
        for value in connectedNodes {
            if visitedArray[value] == 0 {
                // appending the connected nodes in queue at 0 index so that depth can be traversed
                traverseDepth(node: value)
            }
        }
        return
    }
    
    debugPrint("Number of Provinces are \(provinceCount)")
    return provinceCount
}


findProvince(3, [[1, 0, 1],[0, 1, 0],[1, 0, 1]])

//findProvince(2, [[1, 1],[1, 1]])
