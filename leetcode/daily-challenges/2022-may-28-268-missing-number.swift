// https://leetcode.com/problems/missing-number/

/*
Based on the fact the sum of `0...n` = n * (n + 1) / 2 ~ res
We can iterate every `num` in `nums` and do `res -= num`
In the end, whatever value remains in `res` is the missing number
*/

func missingNumber(_ nums: [Int]) -> Int {
  let n = nums.count
  
  var res = n * (n + 1) / 2
  for num in nums {
    res -= num
  }
    
  return res
}
