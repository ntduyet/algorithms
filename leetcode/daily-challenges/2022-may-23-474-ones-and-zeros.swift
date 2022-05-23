// https://leetcode.com/problems/ones-and-zeroes/

func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
  func counter(_ s: String) -> (Int, Int) {
    var res = [0, 0]
    for c in s {
      let i = c.wholeNumberValue!
      res[i] += 1 
    }
      
    return (res[0], res[1])
  }
    
  var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
  for s in strs {
    let (zero, one) = counter(s)
    for i in stride(from: m, through: zero, by: -1) {
      for j in stride(from: n, through: one, by: -1) {
        dp[i][j] = max(dp[i][j], 1 + dp[i - zero][j - one])
      }
    }
  }
    
  return dp[m][n]
}
