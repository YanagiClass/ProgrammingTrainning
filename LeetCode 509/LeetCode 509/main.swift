//
//  main.swift
//  LeetCode 509
//
//  Created by 유용상 on 2023/09/20.
//

import Foundation
// LeetCode509

class Solution {
    func fib(_ n: Int) -> Int {
        var memo: [Int: Int] = [:]
        return fib_helper(n, memo: &memo)
    }
    
    
    
    func fib_helper(_ n: Int, memo: inout [Int: Int]) -> Int {
    
    
        if let value = memo[n] {
            return value
        }
        
    
        if n <= 1 {
            return n
        }
        
    
        let result = fib_helper(n-1, memo: &memo) + fib_helper(n-2, memo: &memo)
        
    
        memo[n] = result
        
    
        return result
    }
}
print(Solution().fib(4))
