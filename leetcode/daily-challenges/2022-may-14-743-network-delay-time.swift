// https://leetcode.com/problems/network-delay-time/

/*
- We can consider each item in `times` an edge of a directed graph 
  --> Build the `graph` from the given `times` (in this case with adjacency list)
- Initialise `dist` where `dist[i]` is the shortest time node `i` receives the signal from `k`
  --> dist[k] = 0
- Run Dijkstra's algorithm starting from k
- Finally, get the maximum value in `dist` and return the according result
 - If the maximum value is `Int.max`, it's impossible for all the `n` nodes to receive the signal, return `-1`
 - Otherwise, return the maximum value
*/

func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
  var graph = Array(repeating: [(Int, Int)](), count: n + 1)
  for time in times {
    let u = time[0], v = time[1], w = time[2]
    graph[u].append((v, w))
  }
    
  var dist = Array(repeating: Int.max, count: n + 1)
  dist[k] = 0 
    
  var q = Heap<(Int, Int)> { $0.1 < $1.1 }
  q.push((k, 0))
    
  while let (u, time) = q.pop() {
    for (v, w) in graph[u] {
      let nextTime = time + w
      if dist[v] > nextTime {
        dist[v] = nextTime
        q.push((v, nextTime))
      }
    }
  }
    
  var res = 0
  for u in 1...n {
    res = max(res, dist[u])
  }
    
  return res == .max ? -1 : res
}
