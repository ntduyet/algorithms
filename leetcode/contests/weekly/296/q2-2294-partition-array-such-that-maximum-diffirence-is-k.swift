// https://leetcode.com/problems/partition-array-such-that-maximum-difference-is-k/

/*
We only care about the mimimum and maximum value in each subsequence.
- Sort the araray -> `sorted`.
- Maintain `currMin/currMax` denoting the minimum and maximum value in the subsequence we're considering.
- Iterate every `num` in `sorted`
  - Update `currMin/currMax` accordingly
  - If `currMax - currMin > k`, the current subsequence no longer satisfies the requirement 
    --> We need a new subsequence
    --> Update `currMin/currMax` and increase the result 
*/

func partitionArray(_ nums: [Int], _ k: Int) -> Int {
  let sorted = nums.sorted()
    
  var currMin = sorted[0], currMax = currMin, res = 1
  for num in sorted {
    currMin = min(currMin, num)
    currMax = max(currMax, num)
    if currMax - currMin > k {
      res += 1 
      currMin = num
      currMax = num
    }
  }
    
  return res
}
