// https://leetcode.com/contest/biweekly-contest-78/problems/number-of-ways-to-split-array/

/*
- Calculate `total` denoting the sum of all elements
- Iterate over every index `i` from `0..<n - 1` and keep track `leftSum` denoting the sum of all elements from `0...i``
    - As we already know `total` and `leftSum`, we should also know `rightSum = total - leftSum`
    - If `leftSum >= rightSum`, increase the result by 1

Time complexity: O(n) where n = nums.count
Space complexity: O(n)
*/

func waysToSplitArray(_ nums: [Int]) -> Int {
  let n = nums.count
  let total = nums.reduce(0, +)
    
  var res = 0, leftSum = 0
  for i in stride(from: 0, to: n - 1, by: 1) {
    leftSum += nums[i]
    let rightSum = total - leftSum
    if leftSum >= rightSum {
      res += 1
    }
  }
    
  return res
}
