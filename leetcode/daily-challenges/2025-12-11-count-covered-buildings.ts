/*
LeetCode Problem: 3531. Count Covered Buildings
Link: https://leetcode.com/problems/count-covered-buildings
Solution: 
  - Iterate over every building at (x, y), we need to:
    + As we're considering vertical line at x, we store min and max value of y so far
      // minX[y] = min(minX[y], x)
      // maxX[y] = max(maxX[y], x)
    + Similarly, considering horizontal line at y, we store min and max value of x so far
      // minY[x] = min(minY[x], y)
      // maxY[x] = max(maxY[x], y)
  - Iterate over every building at (x, y) once again:
    + Based on y, we should be able to retrieve if there are any buldings on the left and right based on minY/maxY
    + Based on x, we also should be able to retrieve if there are any buildings above or below
  - Return the result accumulated so far
  Time complexity: O(n)
  Space complextiy: O(n)
*/

function countCoveredBuildings(n: number, buildings: number[][]): number {
  const minX = Array(n).fill(n + 1);
  const maxX = Array(n).fill(0);
  const minY = Array(n).fill(n + 1);
  const maxY = Array(n).fill(0);

  for (const [x, y] of buildings) {
    minX[y] = Math.min(minX[y], x);
    maxX[y] = Math.max(maxX[y], x);

    minY[x] = Math.min(minY[x], y);
    maxY[x] = Math.max(maxY[x], y);
  }

  let res = 0;
  for (const [x, y] of buildings) {
    const left = minX[y], right = maxX[y];
    const up = maxY[x], down = minY[x];
    if (left < x &&  x < right && down < y && y < up) 
      res++;
  }

  return res;
};
