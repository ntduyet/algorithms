// https://leetcode.com/contest/biweekly-contest-78/problems/maximum-white-tiles-covered-by-a-carpet/

/*
- Sort the `tiles` by start position
- Pre-compute `sums` where `sums[i]` is number of white tiles from `0 -> i`
- Iterate over every index right from 0..<n
    - We try to put the carpet's end at `sorted[right][1]` ~ `end = sorted[right][1]`
    - As we already know `end` and `carpetLen`, we should also know `start = end - carpetLen + 1`
    - We keep track an index `left` denoting the furthest tile on the left that the carpet may cover (entirely or partially). 
    As long as `sorted[left][1] < start`, we eliminate `sorted[left]` as it's no longer covered by the carpet
    - In the end, the carpet may partially cover `sorted[left]` (`sorted[left][0] <= start`) so we need to update the covered area accordingly

Time complexity: O(nlogn) where n = tiles.count
Space complexity: O(n)
*/

func maximumWhiteTiles(_ tiles: [[Int]], _ carpetLen: Int) -> Int {
  func length(_ tile: [Int]) -> Int {
    tile[1] - tile[0] + 1
  }
    
  let n = tiles.count
  let sorted = tiles.sorted { $0[0] < $1[0] }
  var sums = [Int](), sum = 0
  for tile in sorted {
    sum += length(tile)
    sums.append(sum)
  }
    
  var res = 0, left = 0
  for right in 0..<n {
    var curr = left == 0 ? sums[right] : sums[right] - sums[left - 1]
      
    let start = sorted[right][1] - carpetLen + 1
    while left < right, sorted[left][1] < start {
      curr -= length(sorted[left])
      left += 1
    }
      
    curr -= max(0, start - sorted[left][0])
    res = max(res, curr)
  }
    
  return res
}
