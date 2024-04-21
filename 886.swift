//
//  886.swift
//  Contest
//
//  Created by Матвей Кузнецов on 21.04.2024.
//

import Foundation

class Solution886 {
    func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
        var constraints = dislikes
        
        var firstGroup: Set<Int> = [constraints[0][0]]
        var secondGroup: Set<Int> = [constraints[0][1]]
        
        constraints.removeFirst()
        
        while constraints.count > 0 {
            var current: [[Int]] = []
            for constraint in constraints {
                if firstGroup.contains(constraint[0]) || secondGroup.contains(constraint[1]) {
                    if firstGroup.contains(constraint[1]) || secondGroup.contains(constraint[0]) {
                        return false
                    }
                    firstGroup.insert(constraint[0])
                    secondGroup.insert(constraint[1])
                } else {
                    if firstGroup.contains(constraint[1]) || secondGroup.contains(constraint[0]) {
                        if firstGroup.contains(constraint[0]) || secondGroup.contains(constraint[1]) {
                            return false
                        }
                        firstGroup.insert(constraint[1])
                        secondGroup.insert(constraint[0])
                    } else {
                        current.append([constraint[0], constraint[1]])
                    }
                }
            }
            if current.count == constraints.count {
                firstGroup.insert(constraints[0][0])
                secondGroup.insert(constraints[0][1])
                constraints.removeFirst()
            } else {
                constraints = current
            }
        }
        return true
    }
}
