// https://leetcode.com/contest/biweekly-contest-79/problems/maximum-total-importance-of-roads

/*
We can notice that it's most optimal to assign the highest value to node that has maximum number of neighbors and so on so forth.
- Initialise `degree` where `degree[i]` is number of neighbors of node `i`
- Iterate each `road` in `roads` and update `degree` accordingly
- Sort `degree`
- Interate `i` from `1...n`, update `res = degree[i - 1] * i` where `i` is the associated integer value
*/

func maximumImportance(_ n: Int, _ roads: [[Int]]) -> Int {
  var degree = Array(repeating: 0, count: n)
  for road in roads {
    let u = road[0], v = road[1]
    degree[u] += 1 
    degree[v] += 1
  }
    
  degree.sort()
    
  var res = 0
  for i in 1...n {
    res += degree[i - 1] * i
  }
    
  return res
}
