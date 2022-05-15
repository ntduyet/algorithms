// https://leetcode.com/contest/weekly-contest-293/problems/largest-combination-with-bitwise-and-greater-than-zero/

/*
`(a & b) > 0` when `a` and `b` have at least one bit on at the same index `i`
What we need to do is to check every bit `i ` and count how many numbers in `candidates` that has bit `i` on.
Given the constraint `1 <= candidates[j] < 10^7 < 2 ^ 24`, we have 24 possibilities of `i`

Time complexity: O(24n) = O(n) where n = candidates.count
Space complexity: O(1)
*/

func largestCombination(_ candidates: [Int]) -> Int {
  var res = 0
    
  let maxNum = 1 << 24
  var i = 1
  while i <= maxNum {
    var count = 0
    for num in candidates {
      if (num & i) > 0 {
        count += 1
      }
    }
      
    res = max(res, count)
    i <<= 1
  }
    
  return res
}
