// https://leetcode.com/problems/longest-increasing-path-in-a-matrix/

/*
We can use DFS to solve this question. 
- Declare `dfs(i, j, prev)` denoting the longest path starting from cell `(i, j)` and the `matrix[i][j] > prev`
- For each cell `(i, j)`, we may traverse in 4 directions: left, right, up, or down and recurisvely call `dfs` to find the best path
- The longest path can start from any cell in the matrix, so iterate `i` from `0..<m`, `j` from `0..<n` and call `dfs(i, j)` to find the result
*/

func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
  let m = matrix.count, n = matrix[0].count
    
  var dp = Array(repeating: Array(repeating: -1, count: n), count: m)
    
  func move(_ i: Int, _ j: Int) -> [(Int, Int)] {
    [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]
  }
    
  func dfs(_ i: Int, _ j: Int, _ prev: Int = -1) -> Int {
    guard i >= 0, i < m, j >= 0, j < n, matrix[i][j] > prev else { return 0 }
      
    if dp[i][j] != -1 {
      return dp[i][j]
    }
      
    var res = 0
    for (x, y) in move(i, j) {
      res = max(res, 1 + dfs(x, y, matrix[i][j]))
    }
      
    dp[i][j] = res 
    return res
  }
        
  var res = 0
  for i in 0..<m {
    for j in 0..<n {
      res = max(res, dfs(i, j))
    }
  }
    
  return res    
}
