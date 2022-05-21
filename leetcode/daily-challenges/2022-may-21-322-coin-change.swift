// https://leetcode.com/problems/coin-change/

/*
We can use Dynamic Programming to solve this question.
- Initialise `dp = Array(repeating: amount + 1, count: amount + 1)` where `dp[i]` denotes the fewest number of coins to make up amount `i`
  - dp[0] = 0 as we need `0` coins to make up amount `0`
- For each amount `i` from `1...amount`, we can make up the amount `i` by adding 1 `coin` from `i - coin` amount
  -> find the minimum value among `coins`
- In the end, check `dp[amount]` and return the result
  - If `dp[amount] == amount + 1`, it's impossible to make up the amount from the given coins, return `-1`
*/

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
  let coins = coins.sorted()
    
  var dp = Array(repeating: amount + 1, count: amount + 1)
  dp[0] = 0
  for i in stride(from: 1, through: amount, by: 1) {
    for coin in coins {
      // As coins is already sorted, as soon as we face a coin greater than amount `i`, we can skip the rest 
      if coin > i { 
        break 
      }
        
      dp[i] = min(dp[i], dp[i - coin] + 1)
    }
  }
    
  let res = dp[amount]
  return res == amount + 1 ? -1 : res
}
