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
    @Published var habitsOfASpecificDay : [Habit] = []
    private var db = Firestore.firestore()

    
    
    init () {
        getHabits()
        getHabitsForADay(forDay: Date.now)
    }
    
    // ADD HABIT
    func addHabit(_ habit : Habit) {
        do {
            let _ = try db.collection("habits").addDocument(from: habit)
        } catch {
            print("Error adding expense: \(error)")
        }
    }
    
    // UPDATE HABIT
     func updateHabit(_ habitID: String, isCompleted: Bool) {
         let habitRef = db.collection("habits").document(habitID)

         habitRef.updateData(["isCompleted": isCompleted]) { error in
             if let error = error {
                 print("Error updating habit: \(error)")
             } else {
                 print("Habit updated successfully")
             }
         }
     }
    
    // GET HABIT
    
    func getHabitsForADay(forDay date: Date) {
        let startOfDay = Calendar.current.startOfDay(for: date)
        let endOfDay = Calendar.current.date(byAdding: .day, value: 1, to: startOfDay)!

        db.collection("habits")
            .whereField("date", isGreaterThanOrEqualTo: startOfDay)
            .whereField("date", isLessThan: endOfDay)
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    return
                }
                
                self.habitsOfASpecificDay = documents.compactMap { document in
                    do {
                        return try document.data(as: Habit.self)
                    } catch {
                        return nil
                    }
                }
            }
    }
    //
    
    
    func getHabits() {
        db.collection("habits")
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    return
                }
                
                self.habits = documents.compactMap { document in
                    do {
                        return try document.data(as: Habit.self)
                    } catch {
                        return nil
                    }
                }
            }
    }
    
    
}
