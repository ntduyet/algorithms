// https://leetcode.com/problems/shortest-path-in-binary-matrix/

/* 
This is a classic graph question representing by a matrix so just use BFS to find the shortest path.
*/
func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
  func move(_ i: Int, _ j: Int) -> [(Int, Int)] {
    var res = [(Int, Int)]()
    for dx in -1...1 {
      for dy in -1...1 where !(dx == 0 && dy == 0) {
        res.append((i + dx, j + dy))
      }
    }
      
    return res 
  }
    
  let m = grid.count, n = grid[0].count      
  if grid[0][0] == 1 || grid[m - 1][n - 1] == 1 {
    return -1 
  }
    
  var visited = Array(repeating: Array(repeating: false, count: n), count: m) 
  visited[0][0] = true 
    
  var q = [(0, 0)], step = 1
  while !q.isEmpty {
    var newQ = [(Int, Int)]() 
      
    for (i, j) in q {
      if i == m - 1, j == n - 1 {
        return step
      }
        
      for (x, y) in move(i, j) {
        guard x >= 0, x < m, y >= 0, y < n, grid[x][y] == 0, !visited[x][y] else { continue }
          
        visited[x][y] = true
        newQ.append((x, y))
      }
    }
      
    step += 1
    q = newQ
  }
    
    
  return -1
}
