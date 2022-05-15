// https://leetcode.com/problems/deepest-leaves-sum/

func deepestLeavesSum(_ root: TreeNode?) -> Int {
  func dfs(_ root: TreeNode?) -> (depth: Int, leavesSum: Int) {
    guard let root = root else { return (0, 0) }

    if root.left == nil, root.right == nil {
      return (1, root.val)
    }

    let l = dfs(root.left)
    let r = dfs(root.right)
    if l.depth == r.depth {
      return (1 + l.depth, r.leavesSum + r.leavesSum)
    } else if l.depth > r.depth {
      return (1 + l.depth, l.leavesSum)
    } else {
      return (1 + r.depth, r.leavesSum)
    }
  }

  func bfs(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    var q = [root], res = 0
    while !q.isEmpty {
      var newQ = [TreeNode]()
      var sum = 0 
      for node in q {
        sum += node.val 
        newQ.append(contentsOf: [node.left, node.right].compactMap { $0 })
      }
      
      res = sum
      q = newQ
    }
    
    return res
  }

  /// DFS
  // let res = dfs(root)
  // return res.leavesSum

  // BFS
  return bfs(root)
}
