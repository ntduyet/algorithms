// https://leetcode.com/problems/critical-connections-in-a-network/

/*
The graph is formed by several strongly connected components and two components connect with each other via an edge called `bridge`.
So the question is about finding all the bridges that if we remove a bridge, two components may be now disconnected.

William Fiset has a great video and Github repo explaining it very well.
  - https://www.youtube.com/watch?v=aZXi1unBdJA
  - https://github.com/williamfiset/Algorithms/blob/80a2593fca238d47636b44bb08c2323d8b4e5a9d/src/main/java/com/williamfiset/algorithms/graphtheory/BridgesAdjacencyList.java
*/

func criticalConnections(_ n: Int, _ connections: [[Int]]) -> [[Int]] {
  var graph = Array(repeating: [Int](), count: n)
  for c in connections {
    let u = c[0], v = c[1]
    graph[u].append(v)
    graph[v].append(u)
  }
    
  var times = Array(repeating: -1, count: n)
  var lowLink = Array(repeating: n + 1, count: n)
  var res = [[Int]](), time = 0
  func dfs(_ u: Int, _ parent: Int = -1) {
    times[u] = time
    lowLink[u] = time
    time += 1
      
    for v in graph[u] where v != parent {
      if times[v] == -1 {
        dfs(v, u)
        lowLink[u] = min(lowLink[u], lowLink[v])
        if times[u] < lowLink[v] {
          res.append([u, v])
        }
      } else {
        lowLink[u] = min(lowLink[u], times[v])
      }
    }
  }
    
  dfs(0)
    
  return res    
}
