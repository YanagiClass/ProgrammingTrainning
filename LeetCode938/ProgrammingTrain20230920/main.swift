//
//  main.swift
//  ProgrammingTrain20230920
//
//  Created by 유용상 on 2023/09/20.
//

import Foundation



//LeetCode 938
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

var inputNd = TreeNode(10)
var nd1 = TreeNode(5)
var nd2 = TreeNode(15)
var nd3 = TreeNode(3)
var nd4 = TreeNode(7)
var nd5 = TreeNode(18)

inputNd.left = nd1
inputNd.right = nd2
nd1.left = nd3
nd1.right = nd4
nd2.left = nil
nd5.right = nd5




class Solution {
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        var ans = 0
        guard let root = root else {
            return 0
        }
        dfs(root, L, R, &ans)
        return ans
    }
    
    private func dfs(_ node: TreeNode, _ l: Int, _ r: Int, _ ans: inout Int) {
        if l <= node.val && node.val <= r {
            ans += node.val
        }
        if l < node.val && node.left != nil {
            dfs(node.left!, l, r, &ans)
        }
        if node.val < r && node.right != nil {
            dfs(node.right!, l, r, &ans)
        }
    }
}


print(Solution().rangeSumBST(inputNd, 7, 15))


