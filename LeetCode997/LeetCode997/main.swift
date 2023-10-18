//
//  main.swift
//  LeetCode997
//
//  Created by 유용상 on 2023/10/18.
//

import Foundation

class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var result: Int = 0
        //키값이 n(라벨)인 딕셔너리를 생성
        var peopleDict:[Int:Int] = [:]
        for i in 1...n {
            //초기화
            peopleDict[i] = 0
        }
        for j in trust{
            peopleDict[j[1]]! += 1
        }
        for k in peopleDict{
            if(k.value == n - 1){
                result = k.key
                for l in trust{
                    if(l[0] == k.key && l[1] != 0){
                        result = -1
                    }
                }
            }
        }
        
        if(result == 0){
            result = -1
        }
        
        
        return result
    }
}
print(Solution().findJudge(2, [[1,2]]))
