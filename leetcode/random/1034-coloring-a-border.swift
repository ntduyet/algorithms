// https://leetcode.com/problems/coloring-a-border/

/*
We can use BFS to solve this question.
- Intialise `res` denoting the final grid we're gonna return 
- Initialise `visited` where `visited[i][j] == true` means we already visited cell `(i, j)`
- Declare `initialColor = grid[row][col]`
- Initialise `q = [(row, col)]` and mark `visited[row][col] = true`
- While `q` is not empty:
  - Iterate each cell `(i, j)` in `q`:
    - If `(i, j)` is at the first or last row or column -> it's definitely a border
    - Visit 4 adjacent cells, for each cell `(x, y)` we need to check:
      - If `grid[x][y] != initialColor`, `(i, j)` is a border 
      - Otherwise, push `(x, y)` to `q` for the next visit in case `visited[x][y] == false`
    - If we can confirm `(i, j)` is a border, update `res[i][j] = color`
- Return `res` as the final result
*/

func colorBorder(_ grid: [[Int]], _ row: Int, _ col: Int, _ color: Int) -> [[Int]] {
  func move(_ i: Int, _ j: Int) -> [(Int, Int)] {
    [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]
  }
    
  var res = grid
  let m = grid.count, n = grid[0].count, initialColor = grid[row][col]
    
  var q = [(row, col)]
  var visited = Array(repeating: Array(repeating: false, count: n), count: m)
  visited[row][col] = true
    
  while !q.isEmpty {
    var newQ = [(Int, Int)]()
      
    for (i, j) in q {
      var isBorder = i == 0 || i == m - 1 || j == 0 || j == n - 1
      for (x, y) in move(i, j) {
        guard x >= 0, x < m, y >= 0, y < n else { continue }
            
        if grid[x][y] != initialColor {
          isBorder = true
        } else if !visited[x][y] {
          newQ.append((x, y))  
          visited[x][y] = true
        }
      }
        
      if isBorder {
        res[i][j] = color
      }
    }
      
    q = newQ 
  }
    
  return res
}
