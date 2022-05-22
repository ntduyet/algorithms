// https://leetcode.com/problems/palindromic-substrings/

func countSubstrings(_ s: String) -> Int {
  let arr = Array(s), n = arr.count
    
  var res = 0
    
  func expand(_ i: Int, _ j: Int) {
    var left = i, right = j
    while left >= 0, right < n, arr[left] == arr[right] {
      res += 1 
      left -= 1
      right += 1 
    }
  }
    
  for i in 0..<n {
    expand(i, i)
    expand(i, i + 1)
  }
    
  return res
}
