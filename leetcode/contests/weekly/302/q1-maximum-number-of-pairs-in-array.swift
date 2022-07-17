// https://leetcode.com/contest/weekly-contest-302/problems/maximum-number-of-pairs-in-array/

func numberOfPairs(_ nums: [Int]) -> [Int] {
  var res = [0, 0]
  var counter = [Int: Int]()
  for num in nums {
    if counter[num] != nil {
      res[0] += 1
      counter[num] = nil
    } else {
      counter[num] = 1
    }
  }
    
  res[1] = counter.count
  return res
}
