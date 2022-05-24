// https://leetcode.com/problems/longest-valid-parentheses/

func longestValidParentheses(_ s: String) -> Int {
  var stack = [-1], res = 0, i = 0
  for c in s {
    if c == "(" {
      stack.append(i)
    } else {
      stack.popLast()
        
      if let lastIndex = stack.last {
        res = max(res, i - lastIndex)
      } else {
        stack.append(i)
      }
    }
      
    i += 1 
  }
    
  return res
}
