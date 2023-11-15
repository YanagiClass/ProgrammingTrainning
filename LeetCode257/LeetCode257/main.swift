//
//  main.swift
//  LeetCode257
//
//  Created by 유용상 on 2023/11/01.
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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else {
            return []
        }
        if root.left == nil && root.right == nil {
            return ["\(root.val)"]
        }
        return (binaryTreePaths(root.left) + binaryTreePaths(root.right))
        .map { "\(root.val)->" + $0 }
    }
}
