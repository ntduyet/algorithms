// https://leetcode.com/problems/maximum-length-of-a-concatenated-string-with-unique-characters/

/*
Can use backtracking to solve this question.

For each index `i`, we have 2 options:
  - To skip it from the result, just call backtrack(i + 1)
  - To consider it:
    - We maintain a `mask` consiting of `26` bits where `bit j = 1` means character at index `j` is already in use
    - Iterate each character `c` in `arr[i]`:
      - If `c` is already in use, we cannot use `arr[i]` with the current combination, just backtrack and try another combination 
      - In the end if `arr[i]` is a valid candidate, continue with `backtrack(i + 1)` 
  - `i == n` means we already check all the possibilities of the current path, update the result accordingly
*/

func maxLengthOfConcatenatedStringWithUniqueCharacters(_ arr: [String]) -> Int {
  func index(_ c: Character) -> Int {
    Int(c.asciiValue! - Character("a").asciiValue!)
  }
    
  let n = arr.count
  var mask = 0, res = 0
  func backtrack(_ i: Int = 0) {
    if i == n {
      res = max(res, mask.nonzeroBitCount)
      return
    }
    
    backtrack(i + 1)
      
    let oldMask = mask
    defer {
      mask = oldMask
    }
      
    for c in arr[i] {
      let j = index(c)
      if (mask & (1 << j)) != 0 {
        return
      }
        
      mask |= (1 << j)
    }
      
    backtrack(i + 1)
  }
    
  backtrack()
    
  return res
}
