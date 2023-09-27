//
//  main.swift
//  LeetCode22
//
//  Created by 유용상 on 2023/09/27.
//

import Foundation
class Solution {
    private var history: Dictionary<Int, [String]> = [:]
    func generateParenthesis(_ n: Int) -> [String] {
        return generate(n)
    }
    func generate(_ n: Int) -> [String] {
        if let result = history[n] {
            return result
        }
        if n == 1 {
            self.history[1] = ["()"]
        } else {
            var currentSet = Set<String>()
            for p in generate(n-1) {
                currentSet.insert("(\(p))")
            }
            for l in 1..<n {
                var r = n - l
                var leftRes = generate(l)
                var rightRes = generate(r)
                for left in leftRes {
                    for right in rightRes {
                        currentSet.insert(left + right)
                    }
                }
            }
            self.history[n] = Array(currentSet)
        }
        return self.history[n] ?? []
    }
}
print(Solution().generateParenthesis(3))
