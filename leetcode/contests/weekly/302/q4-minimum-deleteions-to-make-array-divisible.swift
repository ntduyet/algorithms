// https://leetcode.com/contest/weekly-contest-302/problems/minimum-deletions-to-make-array-divisible/

/*
- Sort `nums` in ascending order into `sorted`
- Compute `divisor` denoting the greatest common divisor of all items in `numsDivide`
- Iterate `i` from `0..<n` where `n = nums.count`
  - `divisor % sorted[i] == 0` means `sorted[i]` is divisible by all items in `numsDivide` 
    -> return `i + 1` as the result
- In the end, return `-1` as we couldn't find a valid answer
*/

func minOperations(_ nums: [Int], _ numsDivide: [Int]) -> Int {
  func gcd(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : gcd(b, a % b)
  }      
    
  let n = nums.count
  let sorted = nums.sorted()
    
  var divisor = numsDivide[0]
  for i in 1..<numsDivide.count {
    divisor = gcd(divisor, numsDivide[i])
  }
    
  for i in 0..<n {
    if divisor % sorted[i] == 0 {
      return i + 1
    }
  }
    
  return -1
}
