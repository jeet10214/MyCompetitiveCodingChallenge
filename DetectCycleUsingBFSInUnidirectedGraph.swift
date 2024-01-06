import Foundation

func detectCycle(vertexs: [[Int]], n: Int, startingNode: Int) -> Bool {
    
    var graph = Array(repeating: Array<Int>(), count: n + 1)
    for edges in vertexs {
        graph[edges[0]] += [edges[1]]
        graph[edges[1]] += [edges[0]]
    }
    
    // Priting the adjacency matrix
    for i in 1..<graph.count {
        debugPrint(" \(i) -> \(graph[i])")
    }
    
    // Visited Node Array
    var visitedArray = Array(repeating: 0, count: n + 1)
    
    // Created a queue to add nodes and remove them in FIFO order
    var nodeQueue: [[Int]] = []
    nodeQueue.append([startingNode, -1])
    
    while !nodeQueue.isEmpty {
        // accessing the node that is being visited
        let node = nodeQueue[0][0]
        
        debugPrint("traversed \(node)")
        
        // check whether the node has been visited or not
        if visitedArray[node] == 0 {
            visitedArray[node] = 1
            nodeQueue.remove(at: 0)
            
            let connectedNodes = graph[node]
            debugPrint("here connectedNode \(connectedNodes)")
            
            for value in connectedNodes {
                if visitedArray[value] == 0 && !nodeQueue.contains([value, node]) {
                    nodeQueue.append([value, node])
                }
            }
        } else {
            // if already visited remove from the queue
            nodeQueue.remove(at: 0)
            return true
        }
    }
    
    return false
}


//detectCycle(vertexs: [[1,2], [1,3], [3,4], [2,5], [3,6], [5,7], [6,7]], n: 7, startingNode: 1)

detectCycle(vertexs: [[1,2],[1,3],[2,3]], n: 3, startingNode: 1)
