//
//  main.swift
//  LeetCode338
//
//  Created by 유용상 on 2023/09/27.
//

import Foundation

class Solution {
    func countBits(_ n: Int) -> [Int] {
        var cb:[Int] = []
        if(n == 0){
            return [0]
        }
        if(n == 1){
            return [0,1]
        }
        cb.insert(0, at: 0)
        cb.insert(1, at: 1)
        for i in 2...n{
            cb.insert(cb[i/2] + i % 2, at: i)
        }
        
        return cb
    }
}

print(Solution().countBits(5))
