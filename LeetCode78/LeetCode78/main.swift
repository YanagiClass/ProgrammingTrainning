//
//  main.swift
//  LeetCode78
//
//  Created by 유용상 on 2023/11/01.
//

import Foundation

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        //123이 들어왔다고 가정
        var result: [[Int]] = []
        if nums.count == 0 {
            return result
        }
        result.append([])
        for i in 0..<nums.count{
            let count = result.count
            for j in 0..<count{
                result.append(result[j] + [nums[i]])
            }
        }
        
        return result
    }
}
print(Solution().subsets([1,2,3]))
