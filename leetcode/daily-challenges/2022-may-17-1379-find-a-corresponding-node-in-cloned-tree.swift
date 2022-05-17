// https://leetcode.com/problems/find-a-corresponding-node-of-a-binary-tree-in-a-clone-of-that-tree/

/*
We can traverse the tree and its cloned tree at the same time using BFS.
In order to do that, just maintain a queue `q` where `q[i] = (n1, n2)` in which `n1` is node in the original tree and `n2` is the reference in the cloned tree
Once we've found `n1 === target`, return `n2` as the result
*/

func getTargetCopy(_ original: TreeNode?, _ cloned: TreeNode?, target: TreeNode?) -> TreeNode? {
  guard let original = original, let cloned = cloned else { return nil }

  var q = [(original, cloned)]
  while !q.isEmpty {
    var newQ = [(TreeNode, TreeNode)]() 
    for (n1, n2) in q {
      if n1 === target {
        return n2 
      }

      if n1.left != nil {
        newQ.append((n1.left!, n2.left!))
      }

      if n1.right != nil {
        newQ.append((n1.right!, n2.right!))
      }
    }
    
    q = newQ
  }

  return nil 
}
