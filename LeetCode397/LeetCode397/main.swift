//
//  main.swift
//  LeetCode397
//
//  Created by 유용상 on 2023/09/20.
//

import Foundation

class Solution {
  
    
    func integerReplacement(_ n: Int) -> Int {
           if n == 1 { return 0 }
           if n % 2 == 0 {
               return 1 + integerReplacement(n/2)
           } else {
               return 1 + min(integerReplacement(n-1),
                              integerReplacement(n+1))
           }
       }

    
    
}

print(Solution().integerReplacement(7))
