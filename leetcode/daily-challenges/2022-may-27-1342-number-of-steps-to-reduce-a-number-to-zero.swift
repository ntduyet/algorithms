// https://leetcode.com/problems/number-of-steps-to-reduce-a-number-to-zero/

/*
Just simulate the operations and count the number of steps until number reaches `0`
*/

func numberOfSteps(_ num: Int) -> Int {
  var n = num, res = 0 
  while n > 0 {
    if n % 2 == 0 {
      n /= 2
    } else {
      n -= 1
    }
      
    res += 1
  }
    
  return res
}
