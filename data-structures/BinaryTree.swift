/// Definition for a binary tree node
public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
   
  public init(_ val: Int = 0, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
    self.val = val
    self.left =left
    self.right = right
  }
}
