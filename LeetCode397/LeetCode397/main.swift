//
//  main.swift
//  LeetCode397
//
//  Created by 유용상 on 2023/09/20.
//

import Foundation

class Solution {
    func integerReplacement(_ n: Int) -> Int {
        var n = n
        var count = 0
        
        while n != 1 {
            if n & 1 == 0 {
                n >>= 1
            } else if n == 3 || ((n >> 1) & 1) == 0 {
                n -= 1
            } else {
                n += 1
            }
            count += 1
        }
        
        return count
    }
}

print(Solution().integerReplacement(7))
