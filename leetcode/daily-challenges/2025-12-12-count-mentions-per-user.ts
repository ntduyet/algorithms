/*
LeetCode Problem: 3531. Count Covered Buildings
Link: https://leetcode.com/problems/count-covered-buildings

Intuition:
The main challenge is determining whether a user is online at the time a `HERE` message is sent.
To do this, we need to track when each user last went `OFFLINE` and when they will come back online (at exactly 60 seconds later).
If multiple events happen at the same timestamp, `OFFLINE` must be processed before `MESSAGE` so that a user who just went offline isn't counted as online for messages at that moment.

Approach:
1. Sort events by timestamp.
  - If two events have the same timestamp, process OFFLINE before MESSAGE.
2. Track user online times in an array nextOnline, where
  - nextOnline[id] = the timestamp when the user will become online again.
  - Initially, all users are online (nextOnline[id] = 0).
3. Process each event happened at `time`:
  - If it’s OFFLINE, update nextOnline[id] = time + 60.
  - If it’s a MESSAGE:
    + `ALL` -> Increment everyone’s message count.
    + `HERE` -> Increment only those users for whom time >= nextOnline[id] (i.e., currently online).
    + Otherwise, extract user IDs from the message and increment their counts.
4. Return the mention counts after all events.

Complexity:
- Time: O(nlogn) due to sorting
- Space: O(n) to store `nextOnline` array
*/

function countMentions(numberOfUsers: number, events: string[][]): number[] {
  function order(e1: string[], e2: string[]): number {
    const time1 = parseInt(e1[1]), time2 = parseInt(e2[1])
    if (time1 !== time2) 
      return time1 - time2;
    else if (e1[0] === "OFFLINE")
      return -1;
    else if (e2[0] === "OFFLINE")
      return 1;
    else 
      return 0;
  }

  const n = numberOfUsers;
  events.sort((e1, e2) => order(e1, e2));

  const nextOnline = Array(n).fill(0); 
  const res = Array(n).fill(0);  
  for (const e of events) {
    const time = parseInt(e[1])
    if (e[0] === "OFFLINE") {
      const id = parseInt(e[2])
      nextOnline[id] = time + 60;
    } else {
      const message = e[2];
      switch (message) {
        case "ALL":
          for (let id = 0; id < n; id++) {
            res[id]++;
          }
          break;

        case "HERE":
          for (let id = 0; id < n; id++) {
            res[id] += time >= nextOnline[id] ? 1 : 0;
          }
          break;

        default:
          for (const s of message.split(' ')) {
            let id = parseInt(s.replace('id', ''));
            res[id]++;
          }
      }
    }
  } 

  return res;
};
