/*
LeetCode Problem: 3583. Count Special Triplets
Link: https://leetcode.com/problems/count-special-triplets

Intuition:
For each index `j`, we want to know how many valid numbers exist on the left and right that can form a `special triplet`”` centered around `nums[j]`.
If we know:
  - total[x]: how many times x occurs in the entire array.
  - curr[x]: how many times x has appeared to the left of the current index.
Then:
  - right[x] = total[x] - curr[x]

This lets us compute the number of valid pairs efficiently in a single pass.

Approach:
- Pre-count all frequencies of numbers in the array and store them in total.
- Iterate again through the array, maintaining curr (frequency counts seen so far).
- For each number num:
  - Let `target = num * 2`.
  - The number of valid triplets that can use this num as the middle element is `left[target] * right[target]`, where:
  - left[target] = curr[target]
  - right[target] = total[target] - curr[target]
- Handle the edge case for `0` separately to prevent overcounting.
- Add the results modulo `1e9 + 7`.
* Edge Case:
  - When `num === 0`, the formula double-counts the same element, so one instance must be excluded.

Complexity:
- Time: O(n) — each pass is linear.
- Space: O(n) — storing element frequencies.
*/

function specialTriplets(nums: number[]): number {
  const MOD = BigInt(1e9 + 7);

  const total = new Map<number, number>();
  for (const num of nums) {
    total.set(num, (total.get(num) || 0) + 1);
  }

  const curr = new Map<number, number>();
  let res = 0n;
  for (const num of nums) {
    const target = num * 2;
    const left = BigInt(curr.get(target) || 0);
    const right = BigInt(total.get(target) || 0) - left;
    res += num === 0 ? left * (right - 1n) : left * right;
    res %= MOD;

    curr.set(num, (curr.get(num) || 0) + 1);
  }

  return Number(res);
};
