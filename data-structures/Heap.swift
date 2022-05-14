struct Heap<T> {
  private var tree = [T]()
  
  var isEmpty: Bool {
    tree.isEmpty 
  }
  
  var size: Int {
    tree.count
  }
  
  private let sort: (T, T) -> Bool
  init(sort: @escaping (T, T) -> Bool) {
    self.sort = sort
  }
  
  private func parentIndex(_ index: Int) -> Int {
    (index - 1) / 2
  }
  
  private func leftChildIndex(_ index: Int) -> Int {
    index * 2 + 1
  }
  
  private func rightChildIndex(_ index: Int) -> Int {
    index * 2 + 2 
  }
  
  private mutating func heapifyUp() {
    var index = size - 1
    while parentIndex(index) != index {
      let pIndex = parentIndex(index)
      if sort(tree[index], tree[pIndex]) {
        tree.swapAt(index, pIndex)
        index = pIndex
      } else {
        break
      }
    }
  }
  
  private mutating func heapifyDown() {
    var index = 0
    while leftChildIndex(index) < size {
      var targetIndex = leftChildIndex(index)
      let rightIndex = rightChildIndex(index)
      if rightIndex < size, sort(tree[rightIndex], tree[targetIndex]) {
        targetIndex = rightIndex
      }
      
      if sort(tree[index], tree[targetIndex]) {
        break
      } else {
        tree.swapAt(index, targetIndex)
        index = targetIndex
      }
    }
  }
  
  mutating func push(_ item: T) {
    tree.append(item)
    heapifyUp()
  }
  
  mutating func pop() -> T? {
    guard !isEmpty else { return nil }
    
    let top = tree[0]
    tree.swapAt(0, size - 1)
    tree.popLast()
    
    heapifyDown()
    
    return top
  }
  
  func peek() -> T? {
    tree.first
  }
}