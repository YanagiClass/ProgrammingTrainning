//
//  main.swift
//  LeetCode1518
//
//  Created by 유용상 on 2023/11/15.
//

class Solution {
    func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
        var fillWater = 0
        var emptyWater = 0
        var numBottles = numBottles
        
        fillWater += numBottles
        emptyWater += numBottles
        
        while(emptyWater >= numExchange){
            fillWater += Int(emptyWater/numExchange)
            var currempty = emptyWater
            emptyWater = currempty % numExchange
            emptyWater += Int(currempty/numExchange)
  
        }
        
        return fillWater
    }
}

print(Solution().numWaterBottles(9, 3))
