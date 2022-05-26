// https://leetcode.com/problems/number-of-1-bits/

/*
- Keep shifting bits to right until `n` reaches `0`
  - `n & 1 == 1` means the last bit is `1` -> increase the result
*/

func hammingWeight(_ n: Int) -> Int {
  var n = n, res = 0
  while n > 0 {
    res += n & 1
    n = n >> 1
  }
    
  return res
}
