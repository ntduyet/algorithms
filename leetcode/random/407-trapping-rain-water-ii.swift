// https://leetcode.com/problems/trapping-rain-water-ii/

/*
A brutal approach could be to iterate every cell `(i, j)` and try to find how much water it can trap.
  - To do that, run DFS from `(i, j)` to find `minHeight` of the surrounding walls
  - Calculate how much water it can trap by `minHeight - heightMap[i][j]`

A more optimal approach is to pour the water from the shortest "wall" and let the water flow to the shorter neighbors.
- In order to keep track the shortest "wall" efficiently, we can use a min heap (priority)
- First, push all cells on the borders (row 0 or m - 1 and column 0 or n - 1) to `heap`
- While heap is not empty
  - Pop the min item `(i, j)` out of `heap`
  - Run BFS from `(i, j)` to pour the water
    - Traverse to each neighbor `(x, y)`
      - If `(x, y)` is on the borders or we have already visited, just skip
      - If `heightMap[x][y] <= heightMap[i][j]`, the water can pass through `(x, y)` 
        and we can trap `heightMap[i][j] - heightMap[x][y]` water
        -> increase the result and put `(x, y)` to the queue for next BFS consideration
      - Otherwise, the water cannot pass through `(x, y)` meaning we have faced another "wall", push `(x, y)` to `heap`
      - Mark `(x, y) as visited` to avoid duplication
*/

func trapRainWater(_ heightMap: [[Int]]) -> Int {
  let m = heightMap.count, n = heightMap[0].count
  guard m >= 3, n >= 3 else { return 0 }
    
  var heap = Heap<(Int, Int)> { c1, c2 in
    heightMap[c1.0][c1.1] < heightMap[c2.0][c2.1]
  }
  for i in stride(from: 1, to: m - 1, by: 1) {
    heap.push((i, 0))
    heap.push((i, n - 1))
  }
    
  for j in stride(from: 1, to: n - 1, by: 1) {
    heap.push((0, j))
    heap.push((m - 1, j))
  }
    
  func move(_ i: Int, _ j: Int) -> [(Int, Int)] {
    [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]
  }

  var visited = Array(repeating: Array(repeating: false, count: n), count: m)
  var res = 0
  while let (i, j) = heap.pop() {
    let height = heightMap[i][j]
    var q = [(i, j)]
    while !q.isEmpty {
      var newQ = [(Int, Int)]() 
      for (i, j) in q {
        for (x, y) in move(i, j) {
          guard x >= 1, x < m - 1, y >= 1, y < n - 1, !visited[x][y] else { continue }
            
          visited[x][y] = true
            
          if heightMap[x][y] <= height {
            res += height - heightMap[x][y]
            newQ.append((x, y))
          } else {
            heap.push((x, y))
          }
        }
      }
        
      q = newQ
    }
  }
    
  return res
}
