// https://leetcode.com/contest/weekly-contest-293/problems/maximum-consecutive-floors-without-special-floors/

/*
This question is about finding the maximum gap between 2 consecutive elements in a sorted array.
- Add `bottom - 1` and `top + 1` to the special array --> `arr`
- Sort `arr`
- Iterate `i` from `1..<n`, check the difference between `arr[i] - arr[i - 1]` and update the result accordingly

Time complexity: O(nlogn) where n = special.count
Space complexity: O(n)
*/

func maxConsecutive(_ bottom: Int, _ top: Int, _ special: [Int]) -> Int {
  var arr = special
  arr.append(bottom - 1)
  arr.append(top + 1)
  arr.sort()
    
  var res = 0
  for i in stride(from: 1, to: arr.count, by: 1) {
    res = max(res, arr[i] - arr[i - 1] - 1)
  }
    
  return res
}
