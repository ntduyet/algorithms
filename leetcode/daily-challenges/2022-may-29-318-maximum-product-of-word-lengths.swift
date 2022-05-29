// https://leetcode.com/problems/maximum-product-of-word-lengths/

/*
- Iterate `i` from `0..<n`
  - Compute `map[i]` representing the occurences of 26 lowercase letters in `words[i]`
  - Iterate `j` from `0..<i - 1`
    - Check whether `words[i]` and `words[j]` share any letter in common and update the result accordingly
*/

func maxProduct(_ words: [String]) -> Int {
  let n = words.count
    
  let charA = Character("a")
  func charIndex(_ c: Character) -> Int {
    Int(c.asciiValue! - charA.asciiValue!)
  }
    
  var map = Array(repeating: Array(repeating: 0, count: 27), count: n)
    
  func isValidPair(_ i: Int, _ j: Int) -> Bool {
    for k in 0..<26 {
      if map[i][k] != 0 && map[j][k] != 0 {
        return false    
      }
    }
      
    return true
  }
    
  var res = 0
  for i in 0..<n {
    for c in words[i] {
      map[i][charIndex(c)] += 1
    }

    map[i][26] = words[i].count
      
    for j in stride(from: 0, to: i, by: 1) where isValidPair(i, j) {
      res = max(res, map[i][26] * map[j][26])
    }
  }
    
  return res
}
