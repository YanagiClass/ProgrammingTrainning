//
//  main.swift
//  LeetCode695
//
//  Created by 유용상 on 2023/10/25.
//

import Foundation

class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var maxArea = 0
        
        var grid = grid
        for i in 0..<grid.count{
            for j in 0..<grid[i].count{
                if(grid[i][j] == 1){
                    var count = 0
                    dfs(&grid, &count, i: i, j: j)
                    maxArea = max(maxArea, count)
                }
            }
        }
        
        
        
        return maxArea
    }
    
    func dfs(_ grid: inout [[Int]], _ count: inout Int, i: Int, j: Int){
        if(i < 0 || i >= grid.count || j < 0 ||  j >= grid[i].count || grid[i][j] == 0 ){
            return
        }
        count += 1
        grid[i][j] = 0
        dfs(&grid, &count, i: i+1, j: j)
        dfs(&grid, &count, i: i-1, j: j)
        dfs(&grid, &count, i: i, j: j+1)
        dfs(&grid, &count, i: i, j: j-1)
        
    }
    
}
var grid = [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]
print(Solution().maxAreaOfIsland(grid))

