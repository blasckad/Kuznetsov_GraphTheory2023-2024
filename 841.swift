//
//  841.swift
//  Contest
//
//  Created by Матвей Кузнецов on 21.04.2024.
//

import Foundation

class Solution841 {
    
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var visited: [Int: Bool] = [:]
        visited[0] = true
        
        for key in rooms[0] {
            visit(key)
        }
        
        func visit(_ key: Int) {
            if visited[key] == nil {
                visited[key] = true
                for key in rooms[key] {
                    visit(key)
                }
            }
        }
        
        if visited.count == rooms.count {
            return true
        } else {
            return false
        }
    }
}
