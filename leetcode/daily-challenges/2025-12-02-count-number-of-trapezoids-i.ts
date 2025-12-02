/*
LeetCode Problem: 3623. Count Number of Trapezoids I
Link: https://leetcode.com/problems/count-number-of-trapezoids-i
Solution: 
- As we care about points with same slope, we can group points by their y-coordinate.
- For each unique y-coordinate, we can calculate the number of pairs of points that can form a trapezoid with the previous y-coordinates accumulated so far.
And increase the total number of trapezoids formed accordingly.

For e.g. If we have 3 points at y = 1, 5 points at y = 2 and 10 points at y = 3, the number of trapezoids formed by these points can be calculated as follows:
- For y = 1, we have 3 * (3 - 1) / 2 = 3 pairs, previous pairs = 0 --> we can form 0 trapezoids.
- For y = 2, we have 5 * (5 - 1) / 2 = 10 pairs, previous pairs = 3 --> we can form trapezoids with the 3 pairs from y = 1 --> 3 * 10 = 30 trapezoids.
- For y = 3, we have 10 * (10 - 1) / 2 = 45 pairs, previous pairs = 13 --> we can form trapezoids with the 13 pairs from y = 1 and y = 2 --> 13 * 45 = 585 trapezoids.
- The total number of trapezoids formed is 0 + 30 + 585 = 615.

Time Complexity: O(n), where n is the number of points.
Space Complexity: O(n), for storing counts of points by y-coordinate.
*/

function countTrapezoids(points: number[][]): number {
  const MOD = BigInt(1e9 + 7);

  const map = new Map<number, number>();
  for (const p of points) {
    const y = p[1];
    map.set(y, (map.get(y) || 0) + 1);
  }

  const numberOfPairs = (n: number): bigint => BigInt(n * (n - 1) / 2);

  let pairs = 0n, res = 0n;
  for (const count of map.values()) {
    if (count < 2) continue;

    const newPairs = numberOfPairs(count);
    res += newPairs * pairs;
    res %= MOD;

    pairs += newPairs;
  }

  return Number(res);
};
