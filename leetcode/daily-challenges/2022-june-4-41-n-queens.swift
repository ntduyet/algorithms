// https://leetcode.com/problems/n-queens/

func solveNQueens(_ n: Int) -> [[String]] {
  func finaliseBoard(_ queens: [(Int, Int)]) -> [String] {
    var res = Array(repeating: Array(repeating: Character("."), count: n), count: n)
    for (r, c) in queens {
      res[r][c] = "Q"
    }
      
    return res.map { String($0) }
  }
    
  func canPlace(_ row: Int, _ col: Int, _ queens: [(Int, Int)]) -> Bool {
    for (i, j) in queens {
      if j == col || abs(i - row) == abs(j - col) {
        return false
      }
    }
      
    return true
  }
    
  var queens = [(Int, Int)](), res = [[String]]()
    
  @discardableResult
  func backtrack(_ row: Int = 0) -> Bool {
    if row == n {
      res.append(finaliseBoard(queens))
      return true
    }
      
    var isValid = false, col = 0 
    while !isValid, col < n {
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
