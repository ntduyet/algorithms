// https://leetcode.com/problems/apply-discount-to-prices/

/*
- Gather all `words` of the sentence
- Iterate each `w` in `words`
  - If `w` starts with `$`, it may represent a price
    - If it is, extract the price and apply the discount and append to the result
    - Otherwise, keep it as it is and append to the result 
  - Otherwise, it's a normal word, just append to the result
*/

func discountPrices(_ sentence: String, _ discount: Int) -> String {
  let words = sentence.components(separatedBy: " ")
    
  var res = [String]()
  for w in words { 
    if w.starts(with: "$") {
      let substr = String(Array(w)[1..<w.count])
      if let num = Int(substr) {
        let newPrice = Double(num) * (1 - Double(discount) / 100)
        res.append(String(format: "$%.2f", newPrice))
      } else {
        res.append(w)
      }
    } else {
      res.append(w)
    }
  }
    
  return res.joined(separator: " ")
}
