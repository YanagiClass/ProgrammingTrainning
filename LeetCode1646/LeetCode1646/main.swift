//
//  main.swift
//  LeetCode1646
//
//  Created by 유용상 on 2023/10/04.
//

import Foundation

class Solution {
    func getMaximumGenerated(_ n: Int) -> Int {
        guard n > 1 else { return n }
        var nums: [Int] = [0, 1]
        var res = 1

        for i in 2..<n + 1 {
            if i % 2 == 0 {
                nums.append(nums[i / 2])
            } else {
                nums.append(nums[i / 2] + nums[i / 2 + 1])
            }
            res = max(res, nums[i])
        }
        return res
    }
}

