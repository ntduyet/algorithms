// https://leetcode.com/problems/steps-to-make-array-non-decreasing/

/*
We can maintain a monostack and iterate from back of the array
- Initialise `dp` where `dp[i]` denotes the maximum removal operations at `i`
- While `nums[i]` is greater than peek element `nums[j]` of `stack` meaning we'll need to remove `nums[j]` at some point
  - Pop the peek element
  - Update `dp[i]` and the result accordingly
- Push `i` to stack
*/

func totalSteps(_ nums: [Int]) -> Int {
  let n = nums.count
    
  var dp = Array(repeating: 0, count: n)
  var stack = [Int](), res = 0
  for i in stride(from: n - 1, through: 0, by: -1) {
    while let j = stack.last, nums[i] > nums[j] {
      stack.popLast()
      
      dp[i] = max(dp[i] + 1, dp[j])
      res = max(res, dp[i])
    } 
      
    stack.append(i)
  }
    
  return res
}
