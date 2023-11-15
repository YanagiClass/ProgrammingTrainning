//
//  main.swift
//  LeetCode1971
//
//  Created by 유용상 on 2023/10/30.
//

class Solution {
  func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
      let graph = edges.reduce(into: Array(repeating:[Int](), count:n)) { graph, edge in
          (0...1).forEach { i in graph[edge[i]].append(edge[i^1]) }
      }
      var visited = Set<Int>()
      var bfs = Set([source])
      while !bfs.isEmpty && !bfs.contains(destination) {
          visited = visited.union(bfs)
          bfs = Set(bfs.flatMap {graph[$0]}).subtracting(visited)
      }
      
      return !bfs.isEmpty
      
  }
}

