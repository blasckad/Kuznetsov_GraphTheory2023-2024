//
//  2924.swift
//  Contest
//
//  Created by Матвей Кузнецов on 21.04.2024.
//

import Foundation

class Solution2924 {
    func findChampion(_ n: Int, _ edges: [[Int]]) -> Int {
        
        if n == 1 {
            return 0
        }
        
        var champions: [Int: Bool] = [:]
        var beat: [Int: Bool] = [:]
        
        for edge in edges {
            if beat[edge[0]] == nil {
                champions[edge[0]] = true
            }
            champions[edge[1]] = nil
            beat[edge[1]] = true
        }
        
        
        if champions.count > 1 {
            return -1
        } else {
            if beat.count + champions.count == n {
                return champions.keys.first ?? -1
            } else {
                return -1
            }
            
        }
        
    }
}
