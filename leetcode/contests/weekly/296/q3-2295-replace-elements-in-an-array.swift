// https://leetcode.com/problems/replace-elements-in-an-array/

/*
- Initialise `indices` where `indices[num]` stores all indices `num` appears in the array
- For each `operation`, replace the key of `operation[0]` by `operation[1]`
- Finally, iterate every `key` in `indices` and put `key` to the corresponding indices
*/

func arrayChange(_ nums: [Int], _ operations: [[Int]]) -> [Int] {
  let n = nums.count
    
  var indices = [Int: [Int]]()
  for i in 0..<n {
    indices[nums[i], default: []].append(i)  
  }
    
  for operation in operations {
    let source = operation[0], target = operation[1]
    indices[target] = indices[source]
    indices[source] = nil
  }
    
  var res = Array(repeating: 0, count: n)
  for (key, val) in indices {
    for i in val {
      res[i] = key
    }
  }
    
  return res
}
