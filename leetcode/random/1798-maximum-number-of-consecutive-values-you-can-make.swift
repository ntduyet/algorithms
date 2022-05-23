// https://leetcode.com/problems/maximum-number-of-consecutive-values-you-can-make/

func getMaximumConsecutive(_ coins: [Int]) -> Int {
  let sorted = coins.sorted(), n = coins.count
    
  var res = 0
  for num in sorted {
    if num <= res + 1 {
      res += num
    } else {
      break
    }
  }
    
  return res + 1 // as [] also counts
}
