import Foundation

func depthFirstSearch(vertexs: [[Int]], n: Int, startingNode: Int) {
    
    // Creating Bidirectional Graph
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
    var nodeQueue: [Int] = []
    nodeQueue.append(startingNode)
    
    // Run loop until the Queue is empty
    while !nodeQueue.isEmpty {
        
        // accessing the node that is being visited
        let node = nodeQueue[0]
        
        debugPrint("traversed \(node)")
        
        // check whether the node has been visited or not
        if visitedArray[node] == 0 {
            // marking it as visited and removing it from queue
            visitedArray[node] = 1
            nodeQueue.remove(at: 0)
            
            // fetch the connecting nodes of the visited node
            let connectedNodes = graph[node]
            
            //Run a loop for connected nodes and add it to queue if not visited or not exsist in queue. If already exisits then ignore
            for value in connectedNodes {
                if visitedArray[value] == 0 && !nodeQueue.contains(value) {
                    // appending the connected nodes in queue at 0 index so that depth can be traversed
                    nodeQueue.insert(value, at: 0)
                }
            }
        } else {
            // if already visited remove from the queue
            nodeQueue.remove(at: 0)
        }
    }
    
}

depthFirstSearch(vertexs: [[1,2], [1,3], [2,5], [2,6], [3,7], [3,4], [4,8], [8,7]], n: 8, startingNode: 1)


func depthFirstSearchRecursion(vertexs: [[Int]], n: Int, startingNode: Int) {
    
    // Creating Bidirectional Graph
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
    
    func traverseDepth(node: Int) {
        
        debugPrint("traversed \(node)")
        // check whether the node has been visited or not
        if visitedArray[node] == 0 {
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
        }
        return
    }
    
    traverseDepth(node: startingNode)
    
}

depthFirstSearchRecursion(vertexs: [[1,2], [1,3], [2,5], [2,6], [3,7], [3,4], [4,8], [8,7]], n: 8, startingNode: 1)
