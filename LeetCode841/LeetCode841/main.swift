//
//  main.swift
//  LeetCode841
//
//  Created by 유용상 on 2023/10/18.
//

import Foundation



//n개의 방이 있음
//방은 0부터 n-1까지 라벨링되어있음
//모든방은 잠겨있는데 룸0 만 잠겨있지 않음
//목표는 모든 방을 방문하는건데 잠겨있는방은 키가 있어야함
//방을 방문하면 고유한 키세트를 얻을 수 있음
//각 키들은 고유한 넘버가 있는데 이 고유한 넘버의 방만 해체할수있음
// rooms배열은 키배열이 들어가있음

//class Solution {
//    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
//        var result = true
//        var rooms = rooms
//        var currRoomNum = 0
//        for room in rooms {
//            if(rooms.count == currRoomNum + 1){
//                return true
//            }
//            if(room.contains(currRoomNum + 1) == false){
//                return false
//            }
//            currRoomNum += 1
//        }
//        return true
//
//    }
//}
//print(Solution().canVisitAllRooms([[2],[],[1]]))



class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        // 시작 노드를 큐(bfs)와 방문한 방 목록(visited)에 추가합니다.
        var bfs = Set([0]), visited = bfs
        
        // 큐가 비어질 때까지 루프를 실행합니다.
        while !bfs.isEmpty {
            // 현재 큐(bfs)에 있는 방들의 인접한 방들을 찾아서 새로운 큐를 만듭니다.
            bfs = Set(bfs.flatMap{ rooms[$0] })
            
            // 이미 방문한 방을 제외하고 남은 방들을 선택합니다.
            bfs.subtract(visited)
            
            // 새로운 방을 방문한 방 목록에 추가합니다.
            visited.formUnion(bfs)
        }
        
        // 모든 방을 방문했는지 확인하고 결과를 반환합니다.
        return visited.count == rooms.count
    }
}

print(Solution().canVisitAllRooms([[2],[],[1]]))
