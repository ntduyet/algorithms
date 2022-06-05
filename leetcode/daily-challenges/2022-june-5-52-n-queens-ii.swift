// https://leetcode.com/problems/n-queens-ii/

func totalNQueens(_ n: Int) -> Int {
  func canPlace(_ row: Int, _ col: Int, _ queens: [(Int, Int)]) -> Bool {
    for (i, j) in queens {
      if j == col || abs(i - row) == abs(j - col) {
        return false 
      }
    }
      
    return true
  } 
    
  var queens = [(Int, Int)](), res = 0
  func backtrack(_ row: Int = 0) -> Bool {
    if row == n {
      res += 1 
      return true
    }
      
    var col = 0, isValid = false
    while col < n, !isValid {
      if canPlace(row, col, queens) {
        queens.append((row, col))  
        isValid = backtrack(row + 1)
        queens.popLast()
      }
        
      col += 1
    }
      
    return false
  }
    
  backtrack()
    
  return res
}
