func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    
    var incomingVertexCount: [Int] = Array(repeating: 0, count: prerequisites.count )
    var visitedArray: [Int] = Array(repeating: 0, count: prerequisites.count )
    var stack: [Int] = []
    var queue: [Int] = []
    
    for vertex in prerequisites {
        incomingVertexCount[vertex[1]] += 1
    }
    
    for (i, count) in incomingVertexCount.enumerated() {
        if count == 0 {
            queue.append(i)
        }
    }

    while !queue.isEmpty {
        let value = queue.first ?? 0
        stack.append(value)
        queue.removeFirst()
        visitedArray[value] = 1

        for vertex in prerequisites {
            if vertex[0] == value {
                incomingVertexCount[vertex[1]] -= 1
            }
        }
        
        for (i, count) in incomingVertexCount.enumerated() {
            if count == 0 && visitedArray[i] == 0 && !queue.contains(i) {
                queue.append(i)
            }
        }
    }
    
    return stack
}

findOrder(6, [[5,0], [4,0], [5,2], [2,3], [3,1], [4,1]])
