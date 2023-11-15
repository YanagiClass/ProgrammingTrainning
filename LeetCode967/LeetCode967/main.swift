//
//  main.swift
//  LeetCode967
//
//  Created by 유용상 on 2023/11/07.
//

import Foundation
class Solution {
    func numsSameConsecDiff(_ n: Int, _ k: Int) -> [Int] {
        
        var current = [Int]()
        var results = [Int]()
        
        func step(_ current: inout [Int], _ results: inout [Int], _ n: Int, _ k: Int) {
            guard current.count < n else {
                results.append(Int(current.map { String($0) }.joined())!)
                return
            }
            
            if current.count == 0 {
                for i in 1...9 {
                    current.append(i)
                    step(&current, &results, n, k)
                    current.removeLast()
                }
            } else {
                let last = current.last!
                if last - k >= 0 {
                    current.append(last - k)
                    step(&current, &results, n, k)
                    current.removeLast()
                }
                
                if k != 0 {
                    if last + k <= 9 {
                        current.append(last + k)
                        step(&current, &results, n, k)
                        current.removeLast()
                    }
                }
            }
        }
        
        step(&current, &results, n, k)
        
        return results
    }
}
