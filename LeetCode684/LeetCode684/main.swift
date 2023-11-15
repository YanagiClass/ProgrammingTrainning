//
//  main.swift
//  LeetCode684
//
//  Created by 유용상 on 2023/10/25.
//

import Foundation

class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        var graph = Array(repeating: [Int](), count: edges.count + 1)

        for edge in edges {
            var visited = Set<Int>()
            if graph[edge[0]].count > 0 && graph[edge[1]].count > 0 && dfs(graph, edge[0], destination: edge[1], visited: &visited) {
                return edge
            }

            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
        return []
    }

    func dfs( _ graph :[[Int]], _ source: Int, destination: Int, visited: inout Set<Int>) -> Bool {
        if source == destination { return true }
        visited.insert(source)

        for neighbor in graph[source] {
            if !visited.contains(neighbor) {
                if dfs(graph, neighbor, destination: destination, visited: &visited ){
                    return true
                }
            }
        }

        return false
    }
}

var edges = [[1,2],[1,3],[2,3]]
print(Solution().findRedundantConnection(edges))

