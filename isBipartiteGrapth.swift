import Foundation

func isBipartitegraph(vertexs: [[Int]], n: Int) -> Bool {
    
    // Creating Bidirectional Graph
    var graph = Array(repeating: Array<Int>(), count: n + 1)
    for edges in vertexs {
        graph[edges[0]] += [edges[1]]
        graph[edges[1]] += [edges[0]]
    }
    
    var colorArray: [Int] = Array(repeating: -1, count: n + 1)
    
    func check(start: Int) -> Bool {
        var queue: [Int] = []
        queue.append(start)
        colorArray[start] = 0
        
        while !queue.isEmpty {
            let node = queue[0]
            queue.removeFirst()
            
            for it in graph[node] {
                if colorArray[it] == -1 {
                    colorArray[it] = colorArray[node] == 0 ? 1: 0
                    queue.append(it)
                } else if colorArray[it] == colorArray[node] {
                    return false
                }
            }
        }
        
        return true
    }
    
    for i in 0...n {
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
