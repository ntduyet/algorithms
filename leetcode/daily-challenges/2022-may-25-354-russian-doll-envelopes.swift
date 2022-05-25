// https://leetcode.com/problems/russian-doll-envelopes/

/*
Sort the envelopes by width then the problem is about finding longest increasing subsequence by height.
*/

func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
  func compare(_ e1: [Int], _ e2: [Int]) -> Bool {
    e1[0] < e2[0] || (e1[0] == e2[0] && e1[1] > e2[1])
  }
    
  let sorted = envelopes.sorted(by: compare)
  let n = sorted.count
    
  var sequence = [Int]()
  func search(_ height: Int) -> Int {
    var left = 0, right = sequence.count - 1
    while left <= right {
      let mid = (left + right) / 2
      let midHeight = sequence[mid]
      if midHeight == height {
        return mid
      } else if midHeight > height {
        right = mid - 1
      } else {
        left = mid + 1
      }
    }
    
    return left
  }
    
  for i in 0..<n {
    let height = sorted[i][1]
    let index = search(height)
    if index == sequence.count {
      sequence.append(height)
    } else {
      sequence[index] = height
    }
  }
    
  return sequence.count
}
