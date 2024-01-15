//
//  Habits.swift
//  Slow
//
//  Created by Vinter Marco on 15.01.2024.
//

import Foundation


struct Habit : Identifiable, Codable {
    var id = UUID()
    let habitName : String
    let description : String
    let date : Date
    let isCompleted : Bool
}


extension User {
    static var MOCK_HABIT = Habit(
        habitName: "Reading",
        description: "I like Reading",
        date: Date.now, isCompleted: false)
}
