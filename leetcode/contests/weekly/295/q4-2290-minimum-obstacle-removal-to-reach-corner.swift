// https://leetcode.com/problems/minimum-obstacle-removal-to-reach-corner/

/*
This is a slight modification of the shortest path problem so we can use Dijkstra's algorithm to solve it.
- Initialise `minRemovals` where `minRemovals[i][j]` represents the minimum number of obstacles to remove to reach cell `(i, j)`
  - Update `minRemovals[0][0] = grid[0][0]` as there might be an obstacle at cell `(0, 0)`
- Use a min heap sorted by the number of obstacles removed so far
- Keep popping `(i, j, removals)` out of `heap`
  - If `i == m - 1, j == n - 1`, we have reached the lower right corner --> return `removals` as the result
  - Otherwise, visit each neighbors `(x, y)`
    - If `nextRemovals = removals + grid[x][y] < minRemovals[x][y]`, we've found a better path to reach `(x, y)`, 
      update `minRemovals[x][y]` and push `(x, y, nextRemovals)` to `heap`
*/

func minimumObstacles(_ grid: [[Int]]) -> Int {
  let m = grid.count, n = grid[0].count
    
  func move(_ i: Int, _ j: Int) -> [(Int, Int)] {
    [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]
  }
    
  var minRemovals = Array(repeating: Array(repeating: Int.max, count: n), count: m)
  minRemovals[0][0] = grid[0][0]
    
  var q = Heap<(Int, Int, Int)> { $0.2 < $1.2 }
  q.push((0, 0, grid[0][0]))
    
  while let (i, j, removals) = q.pop() {
    if i == m - 1, j == n - 1 {
      return removals
    }
      
    for (x, y) in move(i, j) {
      guard x >= 0, x < m, y >= 0, y < n else { continue }
        
      let nextRemovals = removals + grid[x][y]
      if nextRemovals < minRemovals[x][y] {
        minRemovals[x][y] = nextRemovals
        q.push((x, y, nextRemovals))
      }
    }
  }
    
  return 0 
}
