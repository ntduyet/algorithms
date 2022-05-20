// https://leetcode.com/problems/unique-paths-ii/

/*
We can use Dynamic Programming to solve this question. 
- If there is an obstacle at the top-left cell or the bottom-right cell, there is no way for the robot to move -> just return `0`
- Iterate every row `i` from `0..<m` and column `j` from `0..<n`
  - If there is an obstacle at cell `(i, j)`, we can skip as the robot cannot go through it
  - The robot can reach to this cell either from `left` or `up` cell 
    -> number of paths is `number of paths to left cell + number of paths to up cell`
  - Since we only care about 2 most recent rows, we can optimize the space by using 2 1-D array representing the state of the current/previous row 
    in favor of an 2-D array
- Finally, return `dp[n - 1]` as the result
 */

 func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
  let m = obstacleGrid.count, n = obstacleGrid[0].count 
    
  guard obstacleGrid[0][0] == 0, obstacleGrid[m - 1][n - 1] == 0 else { return 0 }
    
  var dp = Array(repeating: 0, count: n)
  dp[0] = 1 
    
  for i in 0..<m {
    var newDP = Array(repeating: 0, count: n)
    for j in 0..<n where obstacleGrid[i][j] == 0 {
      let left = j == 0 ? 0 : newDP[j - 1]
      let up = dp[j]
      newDP[j] = left + up
    }
      
    dp = newDP
  }
    
  return dp[n - 1]
}
