final class UnionFind<T: Hashable> {
  private var index = [T: Int]()
  private var parent = [Int]()
  private var size = [Int]()
  private(set) var numberOfSets = 0

  init(_ arr: [T] = []) {
    arr.forEach(addSet)
  }

  func addSet(_ element: T) {
    index[element] = parent.count
    parent.append(parent.count)
    size.append(1)
    numberOfSets += 1
  }

  func find(_ element: T) -> Int? {
    guard let elementIndex = index[element] else { return nil }

    var root = elementIndex
    while root != parent[root] {
      root = parent[root]
    }

    var i = elementIndex
    while i != root {
      let next = parent[i]
      parent[i] = root
      i = next
    }

    return i
  }

  func isConnected(_ first: T, _ second: T) -> Bool {
    guard let firstSet = find(first), let secondSet = find(second) else { return false }
    return firstSet == secondSet
  }

  func union(_ first: T, _ second: T) {
    guard let firstSet = find(first),
      let secondSet = find(second),
      firstSet != secondSet else { return }

      if size[firstSet] < size[secondSet] {
        parent[firstSet] = secondSet
        size[secondSet] += size[firstSet]
      } else {
        parent[secondSet] = firstSet
        size[firstSet] += size[secondSet]
    }

    numberOfSets -= 1
  }
}