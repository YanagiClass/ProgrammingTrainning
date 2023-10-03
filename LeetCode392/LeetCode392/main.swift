//
//  main.swift
//  LeetCode392
//
//  Created by 유용상 on 2023/10/03.
//

import Foundation

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.isEmpty{
            return true
        }
        var cur = 0
        let sCar = Array(s)
        for item in t{
            if item == sCar[cur]{
                cur += 1
                if cur == s.count{
                    return true
                }
            }
        }
        return false
    }
}

