//
//  main.swift
//  LeetCode894
//
//  Created by 유용상 on 2023/09/23.
//

import Foundation


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}



class Solution {
    func allPossibleFBT(_ n: Int) -> [TreeNode?] {
        if n % 2 == 0 { return [] }
        var dp: [Int: [TreeNode]] = [1: [TreeNode(0)]]
        for count in stride(from: 3, to: n + 1, by: 2) {
            var answer: [TreeNode] = []
            for i in stride(from: 1, to: count - 1, by: 2) {
                let leftOptions = dp[i]!
                let rightOptions = dp[count - i - 1]!
                leftOptions.forEach { left in
                    rightOptions.forEach { right in
                        answer.append(TreeNode(0, left, right))
                    }
                }
            }
            dp[count] = answer
        }
        return dp[n]!
    }
}

