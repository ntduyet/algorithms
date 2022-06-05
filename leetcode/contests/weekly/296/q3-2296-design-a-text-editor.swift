// https://leetcode.com/problems/design-a-text-editor/

/*
We can use a doubly linked list to store the text (each node represents a character of the text) and simulate all the operations.
*/

class TextEditor {
  class Node {
    let val: Character
    var prev: Node?
    var next: Node?
    
    init(_ val: Character) {
      self.val = val
    }
  }
  
  private var cursor: Node
  init() {
    cursor = Node(".")
  }
    
  func addText(_ text: String) {
    for c in text {
      let next = cursor.next
      let node = Node(c)
      
      node.prev = cursor
      cursor.next = node
      
      node.next = next
      next?.prev = node
      cursor = node
    }
  }
    
  func deleteText(_ k: Int) -> Int {
    var count = 0
    while count < k, cursor.val != "." {
      let prev = cursor.prev!
      prev.next = cursor.next
      cursor.next?.prev = prev
      cursor = prev
      count += 1
    }
    
    return count
  }
    
  func cursorLeft(_ k: Int) -> String {
    var count = k
    while count > 0, let prev = cursor.prev {
      cursor = prev
      count -= 1
    }
    
    return leftStr()
  }
    
  func cursorRight(_ k: Int) -> String {
    var count = k
    while count > 0, let next = cursor.next {
      cursor = next
      count -= 1
    }
    
    return leftStr()
  }
  
  private func leftStr() -> String {
    var count = 10, node = cursor, res = ""
    while count > 0, node.val != "." {
      res.append(node.val)
      node = node.prev!
      count -= 1
    }
    
    return String(res.reversed())
  }
}
