//
//  main.swift
//  LeetCode1584
//
//  Created by 유용상 on 2023/10/31.
//


class Solution {
    final class UnionFind {
        private var points: [Int]
        private var ranks: [Int]

        init(size: Int) {
            var points = Array(repeating: 0, count: size)
            for index in points.indices {
                points[index] = index
            }
            self.points = points
            self.ranks = Array(repeating: 1, count: size)
        }

    
        func find(_ x: Int) -> Int {
            let rootNode = points[x]
            guard rootNode != x else {
                return x
            }
            let newRootNode = find(rootNode)
            points[x] = newRootNode
            return newRootNode
        }

        func union(_ x: Int, _ y: Int) {
            let rootX = find(x)
            let rootY = find(y)
            guard rootX != rootY else {
                return
            }

            if ranks[x] > ranks[y] {
                points[rootY] = points[rootX]
            } else if ranks[x] < ranks[y] {
                points[rootX] = points[rootY]
            } else {
                points[rootY] = points[rootX]
                ranks[x] += 1
            }
        }

        func isConnected(x: Int, y: Int) -> Bool {
            return find(x) == find(y)
        }
    }

    struct Edge {
        let pointIndex1: Int
        let pointIndex2: Int
        let distance: Int
    }

    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        let pointsCount = points.count
        var edges = [Edge]()

        for i in 0..<(pointsCount - 1) {
            for j in (i + 1)..<pointsCount {
                let weight = abs(points[i][0] - points[j][0]) + abs(points[i][1] - points[j][1])
                let edge = Edge(pointIndex1: i, pointIndex2: j, distance: weight)
                edges.append(edge)
            }
        }
        edges.sort { $0.distance < $1.distance }

        let unionFind = UnionFind(size: pointsCount)
        var pointsLeft = pointsCount - 1
        var result = 0

        for edge in edges {
            let xiSet = unionFind.find(edge.pointIndex1)
            let xjSet = unionFind.find(edge.pointIndex2)

            if xiSet == xjSet {
                continue
            }

            result += edge.distance
            unionFind.union(edge.pointIndex1, edge.pointIndex2)
            pointsLeft -= 1
            if pointsLeft == 0 {
                break
            }
        }
        return result
    }
}
