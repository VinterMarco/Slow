//
//  AddHabitsViewModel.swift
//  Slow
//
//  Created by Vinter Marco on 15.01.2024.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore


class HabitsManager : ObservableObject {
    
    @Published var habits : [Habit] = []
    private var db = Firestore.firestore()

    
    
    // ADD HABIT
    func addHabit(_ habit : Habit) {
        do {
            let _ = try db.collection("habits").addDocument(from: habit)
        } catch {
            print("Error adding expense: \(error)")
        }
    }
    
    
    
}
