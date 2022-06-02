// https://leetcode.com/problems/check-if-a-string-contains-all-binary-codes-of-size-k/

/*
We can use sliding window and bit manipulation to solve this question.
- Maintain a `mask` consisting of `k` bits and `bitSet` consisting of all masks we've found
- For the first `k` characters, for each `i`, just set bit `i` based on `s[i]`
- For `i` from `k..<n`, as we need to move the window, do a right shift on mask to eliminate the first bit out of the window
  and set bit `k - 1` based on `s[i]`
- Finally, return `bitSet.count == 1 << k` as there are 2^k masks of `k` bits
*/

func hasAllCodes(_ s: String, _ k: Int) -> Bool {
  var bitSet = Set<Int>(), mask = 0, i = 1
    for c in s {
    if i >= k {
      mask >>= 1
    }
        
    let bit = c.wholeNumberValue!
    mask |= (bit << min(i, k - 1))  
      
    if i >= k {
      bitSet.insert(mask)
    }
      
    i += 1 
  }
    
  return bitSet.count == 1 << k
}
