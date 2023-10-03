//
//  main.swift
//  LeetCode118
//
//  Created by 유용상 on 2023/10/03.
//

import Foundation

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
       var matrix = Array(repeating: Array(repeating: 0, count: numRows), count: numRows)
       for i in 0..<numRows {
           matrix[i][0] = 1
           for j in 1..<numRows where i > 0 {
               matrix[i][j] = matrix[i-1][j] + matrix[i-1][j-1]
          }
       }
       return matrix.compactMap{ $0.filter { $0 > 0 }}

    }
}
