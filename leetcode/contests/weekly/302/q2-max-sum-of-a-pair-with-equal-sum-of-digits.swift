// https://leetcode.com/contest/weekly-contest-302/problems/max-sum-of-a-pair-with-equal-sum-of-digits/

/*
- Define a `map` where `map[sum]` keeps track of the 2 maximum that the sum of digits of them is equal to `sum`
- Iterate each `num` in `nums` and update `map` accordingly
- Iterate each `pair` in `map.values`
  - If `pair[1] == 0` (the second max number), we can skip as we only have 1 number
  - Update `res = max(res, pair[0] + pair[1])`
*/

func maximumSum(_ nums: [Int]) -> Int {
  func digitsSum(_ num: Int) -> Int {
    var res = 0, n = num 
    while n > 0 {
      res += n % 10
      n /= 10
    }
      
    return res
  }
    
  var map = [Int: [Int]]()      
  for num in nums {
    let sum = digitsSum(num)
    var curr = map[sum, default: [0, 0]]
    if num > curr[0] {
      curr[1] = curr[0]
      curr[0] = num
    } else if num > curr[1] {
      curr[1] = num
    }
      
    map[sum] = curr
  }
    
  var res = -1
  for pair in map.values where pair[1] > 0 {
    res = max(res, pair[0] + pair[1])
  }
    
  return res
}
