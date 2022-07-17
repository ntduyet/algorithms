// https://leetcode.com/contest/weekly-contest-302/problems/query-kth-smallest-trimmed-number/

/*
The main thing is to pre-compute everything in advance instead of doing it repetitively for each query
- Define `map` where `map[x]` maintains the array of number trimmed to the last `x` digit(s) 
  and their respective index in `nums`
- For each item in `map`, we sort the array so that we can query in constant time 
- Iterate each `q` in `queries` and update the result accordingly
*/

func smallestTrimmedNumbers(_ nums: [String], _ queries: [[Int]]) -> [Int] {
  let n = nums.count 
    
  var map = [Int: [(String, Int)]]()
  for i in 0..<n {
    let arr = Array(nums[i])
    var curr = "", trimmedIndex = 1
    for j in stride(from: arr.count - 1, through: 0, by: -1) {
      curr = String(arr[j]) + curr
      map[trimmedIndex, default: []].append((curr, i))
      trimmedIndex += 1
    }
  }
    
  for key in map.keys {
    map[key, default: []].sort { $0.0 < $1.0 || ($0.0 == $1.0 && $0.1 < $1.1) }
  }
    
  var res = [Int]()
  for q in queries {
    let k = q[0], trim = q[1]
    res.append(map[trim, default: []][k - 1].1)
  }
    
  return res
}
