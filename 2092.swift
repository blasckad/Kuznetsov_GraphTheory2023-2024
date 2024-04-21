//
//  2092.swift
//  Contest
//
//  Created by Матвей Кузнецов on 21.04.2024.
//
class Solution2092 {
    func findAllPeople(_ n: Int, _ meetings: [[Int]], _ firstPerson: Int) -> [Int] {
        
        //    var orderedMeetings = meetings.sorted {$0[2] < $1[2]}
        //    var knowPersons: Set<Int> = [0, firstPerson]
        //    var setMeetings: [Int: [Set<Int>]] = [:]
        //
        //    for meeting in orderedMeetings {
        //
        //        if let existingMeeting = setMeetings[meeting[2]] {
        //            setMeetings[meeting[2]] = existingMeeting + [[meeting[0], meeting[1]]]
        //        } else {
        //            setMeetings[meeting[2]] = [[meeting[0], meeting[1]]]
        //        }
        //
        //        if knowPersons.contains(meeting[0]) {
        //            for meet in setMeetings[meeting[2]] ?? [] {
        //                if meet.contains(meeting[0]) {
        //                    knowPersons = knowPersons.union(meet)
        //                }
        //            }
        //        }
        //        if knowPersons.contains(meeting[1]) {
        //            for meet in setMeetings[meeting[2]] ?? [] {
        //                if meet.contains(meeting[1]) {
        //                    knowPersons = knowPersons.union(meet)
        //                }
        //            }
        //        }
        //    }
        //    return Array(knowPersons)
        
        
        //    Верхний алгоритм сортировал втречи по времени и потом шел по ним, попутно группируя их по времени, таким образом находя контакты людей
        //    Но для эффективности можно сразу сделать и то и то, а затем формировать список людей контактировавших в одно и то же время
        
        
        var knowPersons: Set<Int> = [0, firstPerson]
        var orderedMeetings = [[[Int]]](repeating: [], count: 100001)
        
        for meeting in meetings {
            orderedMeetings[meeting[2]].append([meeting[0], meeting[1]])
        }
        
        for meeting in orderedMeetings where meeting != [] {
            
            var contacts: [Int: [Int]] = [:]
            var knowNow: Set<Int> = []
            
            for meet in meeting {
                let x = meet[0]
                let y = meet[1]
                contacts[x, default: []].append(y)
                contacts[y, default: []].append(x)
                if knowPersons.contains(x) { knowNow.insert(x) }
                if knowPersons.contains(y) { knowNow.insert(y) }
            }
            
            var que = [Int]()
            
            que.append(contentsOf: knowNow)
            
            while !que.isEmpty {
                let x = que.removeFirst()
                for y in contacts[x] ?? [] {
                    if !knowPersons.contains(y) {
                        knowPersons.insert(y)
                        que.append(y)
                    }
                }
            }
            
        }
        return Array(knowPersons)
        
    }
}
