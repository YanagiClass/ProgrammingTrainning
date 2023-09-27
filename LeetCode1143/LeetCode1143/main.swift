//
//  main.swift
//  LeetCode1143
//
//  Created by 유용상 on 2023/09/27.
//

import Foundation
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let m = text1.count
        let n = text2.count
        var result = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        
        let t1Array = Array(text1)
        let t2Array = Array(text2)
        
        for i in 1...m {
            for j in 1...n {
                if t1Array[i - 1] == t2Array[j - 1] {
                    result[i][j] = result[i - 1][j - 1] + 1
                } else {
                    result[i][j] = max(result[i - 1][j], result[i][j - 1])
                }
            }
        }
        
        // 공통 부분 문자열의 길이를 반환하려면:
        return result[m][n]
        
        // 전체 2차원 배열을 반환하려면 아래 주석을 해제하세요:
        // return result
    }
}


print(Solution().longestCommonSubsequence("abcde", "ace"))
//let string = "hello"
//print(string[String.Index(encodedOffset: 1)])
