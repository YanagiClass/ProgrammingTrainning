//
//  main.swift
//  LeetCode398
//
//  Created by 유용상 on 2023/11/22.
//

import Foundation


class Solution {
    var nums:[Int]
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func pick(_ target: Int) -> Int {
        var res:[Int] = []
        for (index, value) in nums.enumerated(){
            if(value == target){
                res.append(index)
            }
        }
        return res.randomElement()!
    }
}
var solution = Solution([1, 2, 3, 3, 3])
print(solution.pick(3))
