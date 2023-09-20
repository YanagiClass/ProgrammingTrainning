//
//  main.swift
//  LeetCode783
//
//  Created by 유용상 on 2023/09/20.
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
    func minDiffInBST(_ root: TreeNode?) -> Int {
        var ans: Int = 0
        //to be solved
        return ans
    }
}
