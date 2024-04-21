//
//  2316.swift
//  Contest
//
//  Created by Матвей Кузнецов on 21.04.2024.
//

import Foundation

class Solution2316 {
    func countPairs(_ n: Int, _ edges: [[Int]]) -> Int {
        
    //    var components: [[Int]] = []
    //
    //        for i in 0...n - 1 {
    //            components.append([i])
    //        }
    //
    //
    //        for edge in edges {
    //            for i in 0...n - 1 {
    //                if components[i].contains(edge[0]) && !components[i].contains(edge[1]) {
    //                    components[i].append(contentsOf: components[edge[1]])
    //                    components[edge[1]] = []
    //                }
    //                 if components[i].contains(edge[1]) && !components[i].contains(edge[0]) {
    //                    components[i].append(contentsOf: components[edge[0]])
    //                    components[edge[0]] = []
    //                }
    //            }
    //        }
    //
    //        components = components.filter {$0.count > 0}
    //
    //    if components.count < 2 {
    //        return 0
    //    }
    //
    //    var sum: Int = 0
    //    var squaresum: Int = 0
    //
    //    for component in components {
    //        sum += component.count
    //        squaresum += component.count*component.count
    //    }
    //
    //    return (sum * sum - squaresum) / 2
    //
        
        
    //    Верхний алгоритм формировал компоненты путем присоединения новых вершин к множествам, но был не эффективен
    //    Переписал с использование dfs по вершинам у которых есть общие ребра
        

        var neighbors = [[Int]](repeating: [], count: n)
        for edge in edges {
            neighbors[edge[0]].append(edge[1])
            neighbors[edge[1]].append(edge[0])
        }
        
        var visited = [Bool](repeating: false, count: n)
        var sum: Int = 0
        var squaresum: Int = 0
        
        for i in 0..<n {
            if !visited[i] {
                let ans = dfs(i, &neighbors, &visited)
                squaresum += ans * ans
                sum += ans
            }
        }
        
        return (sum * sum - squaresum) / 2
        
        func dfs(_ n: Int, _ neighbors: inout [[Int]], _ visited: inout [Bool]) -> Int {
            visited[n] = true
            var ans: Int = 1
            for neighbor in neighbors[n] {
                if !visited[neighbor] {
                    ans += dfs(neighbor, &neighbors, &visited)
                }
            }
            return ans
        }
        
    }
}
