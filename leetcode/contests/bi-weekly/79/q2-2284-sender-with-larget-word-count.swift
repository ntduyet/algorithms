// https://leetcode.com/contest/biweekly-contest-79/problems/sender-with-largest-word-count/

/*
We can basically use Dictionary to store the total number of words sent by the sender
and keep track the sender with the largest word count.
*/

func largestWordCount(_ messages: [String], _ senders: [String]) -> String {
  let n = senders.count
    
  var res = "", maxCount = 0 
  var counter = [String: Int]()
  for i in 0..<n {
    let message = messages[i], sender = senders[i]
    let wordsCount = message.components(separatedBy: " ").count  
    let count = counter[sender, default: 0] + wordsCount
    if count > maxCount || (count == maxCount && sender > res) {
      res = sender
      maxCount = count
    } 
      
    counter[sender] = count
  }
    
  return res
}
