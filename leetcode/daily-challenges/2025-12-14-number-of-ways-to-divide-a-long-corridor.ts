/*
LeetCode Problem: 2147. Number of Ways to Divide a Long Corridor
Link: https://leetcode.com/problems/number-of-ways-to-divide-a-long-corridor

Intuition:
- We can only divide the corridor into valid rooms if the number of seats (`S`) is even since each room must have 2 seats.
- Once we group the corridor by rooms (every pair of seats), the number of plants (`P`) between two consecutive rooms determines the number of possible divider placements.
  - For each pair of adjacent rooms, we can place the divider in any of the gaps formed by the plants between them, which gives (`number of plants between + 1`) possible choices.
    - For e.g. If there is 1 plant, we can install 1 divider on the left and 1 on the right --> 2 choices.
    - If there are 2 plants, we can install 1 divider before 1st plant, 1 between 1st & 2nd plant and another after the 2nd plant --> 3 choices.
- The number of ways to divide the corridor therefore equals the product of all such choices across every adjacent room.

Approach: 
- Declare `seats` denoting total number of seats so far 
- Declare `plants` denoting number of plants between 2 rooms
- Declare `res` denoting number of ways to divide the corridor as per the requirement
- Iterate over every item `c` of the `corridor`:
  - If `c is S`, increase `seats` by `1`
    - If `seats` becomes odd --> a new room should be formed 
      - Update `res` as the product of itself with the number of choices to place dividers based on `plants` --> `res *= (plants + 1)`
      - Remember to modulo `10^9 + 7` as per the requirement
      - Reset `plants` to `0` to start counting over again
  - If `c is P` and `seats` is even and greater than zero --> the plant here is located between 2 possible rooms
    - Increase `plants` by `1`
- Finally, we need to check:
  - If `seats` is not even or fewer than 2 --> we can't divide the corridor --> return `0`
  - Otherwise, return the calculated product `res`

Complexity:
- Time: O(n) as we iterate every item of the corridor
- Space: O(1)
*/

function numberOfWays(corridor: string): number {
  const MOD = BigInt(1e9 + 7);

  let seats = 0, plants = 0, res = 1n;
  for (const c of corridor) {
    if (c === "S") {
      seats++;

      if (seats % 2 === 1) {
        res *= BigInt(plants + 1);
        res %= MOD;
        plants = 0;
      }
    } else if (seats > 0 && seats % 2 === 0) {
      plants++;
    }
  }

  if (seats < 2 || seats % 2 === 1)
    return 0;

  return Number(res);
};
