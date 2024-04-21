//
//  851.swift
//  Contest
//
//  Created by Матвей Кузнецов on 21.04.2024.
//

import Foundation

class Solution851 {
    func loudAndRich(_ richer: [[Int]], _ quiet: [Int]) -> [Int] {
        
        let n = quiet.count
        var graph = Array(repeating: [Int](), count: n)
        var answer = Array(repeating: -1, count: n)
        
        for edge in richer {
            graph[edge[1]].append(edge[0])
        }
        
        func dfs(_ x: Int) -> Int {
            if answer[x] != -1 {
                return answer[x]
            }
            
            answer[x] = x
            
            for y in graph[x] {
                if quiet[dfs(y)] < quiet[answer[x]] {
                    answer[x] = answer[y]
                }
            }
            
            return answer[x]
        }
        
        for i in 0..<n {
            answer[i] = dfs(i)
        }
        
        return answer
    }
}
