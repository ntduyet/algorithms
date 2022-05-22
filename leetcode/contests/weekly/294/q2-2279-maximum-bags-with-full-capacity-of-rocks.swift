// https://leetcode.com/contest/weekly-contest-294/problems/maximum-bags-with-full-capacity-of-rocks/

/*
In order to maximize the number of bags that could have full capacity, 
we should place additional rocks to bag `i` where `capacity[i] - rocks[i]` is minimal
- Create `diffs` array where `diffs[i] = capacity[i] - rocks[i]`
- Sort `diffs` by ascending order
- Maintain `remainingRocks` denoting how many rocks available
- Iterate every `diff` in `diffs`:
  - `diff <= remainingRocks` means we still have enough rocks to maximize a bag 
    -> increase `res` by `1` and remove `diff` rocks from `remainingRocks`
  - Otherwise, we cannot make any bag full anymore
*/

func maximumBags(_ capacity: [Int], _ rocks: [Int], _ additionalRocks: Int) -> Int {
  var diffs = zip(capacity, rocks).map { $0.0 - $0.1 }
    diffs.sort()
    
  var res = 0, remainingRocks = additionalRocks
  for diff in diffs {
    if diff <= remainingRocks {
      res += 1
      remainingRocks -= diff
    } else {
      break
    }
  }
  return res
}
