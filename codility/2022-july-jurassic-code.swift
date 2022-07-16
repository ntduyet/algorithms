// https://app.codility.com/programmers/challenges/jurassic_code2022/
// Task Description: https://app.codility.com/cert/view/certSVJKF7-UAWUH86WF7GJH73X/details/
// Certificate: https://app.codility.com/cert/view/certSVJKF7-UAWUH86WF7GJH73X

/*
- Iterate each point and put its distance to the origin to the respective array
  - If point's color is "R", append to `reds`
  - Otherwise, append to `greens`
- Sort `reds` and `greens` in ascending order
- As we only care about the circle containing an equal number of red and green points,
  we can iterate `i` from `0..<min(m, n)` where `m = reds.count` and `n = greens.count`
  - Find the maxium radius/distance containing both `reds[i]` and `greens[i]`
  - If the `radius` is less than next item in `reds` and `greens`,
    the current circle we're considering is a valid one containing `i + 1` red points and `i + 1` green points
    -> update `res = i + 1`
- Finally, return `res * 2` as the result
*/

func maxNumberOfPoints(_ X: [Int], _ Y: [Int], _ colors: String) -> Int {
  func dist(_ x: Int, _ y: Int) -> Int {
    return x * x + y * y
  }

  var reds = [Int](), greens = [Int]()
  var index = 0
  for c in colors {
    let x = X[index], y = Y[index]
    if c == "R" {
      reds.append(dist(x, y))
    } else {
      greens.append(dist(x, y))
    }
     
    index += 1 
  }

  reds.sort()
  greens.sort()

  let m = reds.count, n = greens.count
  var res = 0
  for i in 0..<min(m, n) {
    let radius = max(reds[i], greens[i])
    let nextRed = i == m - 1 ? Int.max : reds[i + 1]
    let nextGreen = i == n - 1 ? Int.max : greens[i + 1]
    if radius < nextRed, radius < nextGreen {
      res = i + 1
    }
  }

  return res * 2
}
