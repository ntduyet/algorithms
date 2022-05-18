// https://leetcode.com/problems/minimum-sideway-jumps/

/*
This can be soved by using Dynamic Programming. And we may solve a DP question by top-down or bottom-up approach.

Top-down
- Declare `dp(lane, pos)` denoting the minimum number of jumps that the frog must take to reach the last position at `n`
  - If `pos >= n - 1`, the frog has already reached the last position, just return `0`
  - If `obstacles[pos] == lane`, the frog cannot take this move, return `Int.max` to distinguish the invalid cases
  - Now, the frog can either:
    - Go straight -> dp(lane, pos + 1) (1)
    - Make a jump to another lane which adds `1` to the result (2)
    - Pick the better option (that takes less jumps) between (1) and (2)
- Return `dp(2, 0)` as the result since the frog starts on the second lane and at the index `0`

Bottom-up
- Transform recursive top-down to interative
*/

func minSideJumps(_ obstacles: [Int]) -> Int {
  let n = obstacles.count

  // Top-down
  func topDown() -> Int {
    var memo = Array(repeating: Array(repeating: -1, count: n), count: 4)
    func dp(_ lane: Int, _ pos: Int) -> Int {
      if pos >= n - 1 {
        return 0
      }
      
      if obstacles[pos] == lane {
        return .max
      }
      
      if memo[lane][pos] != -1 {
        return memo[lane][pos]
      }
      
      var res = Int.max
      for i in 1...3 where obstacles[pos] != i {
        let next = dp(i, pos + 1)
        guard next != .max else { continue }
        
        if i == lane {
          res = min(res, next)
        } else {
          res = min(res, 1 + next)
        }
      }
      
      memo[lane][pos] = res
      return res
    }
    
    return dp(2, 0)
  }    

  // Bottom-up
  func bottomUp() -> Int {
    var dp = Array(repeating: Array(repeating: Int.max, count: 3), count: n + 1)
    dp[0][0] = 1
    dp[0][1] = 0
    dp[0][2] = 1 
    
    for i in 1...n {
      let lane = obstacles[i - 1]
      if lane > 0 {
        dp[i][lane - 1] = Int.max  
      }
      
      for j in 0..<3 where j != lane - 1 {
        var prev = min(dp[i - 1][(j + 1) % 3], dp[i - 1][(j + 2) % 3])
        if prev != .max {
          prev += 1
        }
        
        dp[i][j] = min(dp[i - 1][j], prev)
      }
    }
      
    return dp[n].min() ?? .max
  }

  return bottomUp() // or return topDown()
}
