//
//  HabitsAndProgressView.swift
//  Slow
//
//  Created by Vinter Marco on 17.01.2024.
//

import SwiftUI

struct HabitsAndProgressView: View {
    
    var stage1 = "Starting small enhances goal achievement"
    var stage2 = "You have a great start"
    var stage3 = "Great job until now"
    var stage4 = "Keep up the momentum"
    var stage5 = "Last mile"
    var stage6 = "Completed"
    @State private var progessTitle = "title"
    @State private var completionRate = 66.6
    @State var numberOfTasks : Double = 3.0
    @State var numberOfCompletedTasks : Double = 1.0
    var pinkColor  = Color(red : 255/255,green : 121/255, blue : 201/255)
    var purpleColor  = Color(red : 97/255,green : 1/255, blue : 238/255)

    
    
    func getNumberOfTasks(habits : [Habit]) -> Int {
        var all = 0
        for habit in habits {
             all += 1
        }
        return all
    }
    
    func getNumberOfCompletedTasks(habits : [Habit]) -> Int {
        var all = 0
        for habit in habits {
            if habit.isCompleted == true {
                all += 1
            }
        }
        return all
    }
    
    @EnvironmentObject var habitsManager : HabitsManager

    var body: some View {
        Text("s")
//        VStack {
//            VStack(alignment : .leading) {
//                HStack {
//                    Text("\(progessTitle)")
//                        .font(.footnote)
//                        .foregroundStyle(.gray)
//                        .offset(y : 10)
//                    Spacer()
//                    Text("\(String(format: "%.1f", completionRate))%")
//                        .font(.footnote)
//                        .foregroundStyle(.gray)
//                        .offset(y : 10)
//                }
//                ProgressView("", value: numberOfCompletedTasks, total: numberOfTasks)
//                    .scaleEffect(y : 2.3)
//                    .offset(y : -10)
//                    .tint(pinkColor)
//            }
//            Divider()
//                .padding(.vertical)
//            
//            VStack  (alignment : .leading){
//                ProgressView("", value: numberOfCompletedTasks, total: numberOfTasks)
//                    .opacity(0)
//                
//                ScrollView(showsIndicators: false) {
//                    VStack(spacing: 20) {
//                        ForEach(habitsManager.habitsForCurrentMonth, id: \.id) { habit in
//                            HStack(spacing: 20) {
//                                Button(action: {
//                                    habitsManager.updateHabit(habit.documenttName ?? "", isCompleted: !habit.isCompleted)
//                                    
//                                        
//                                    print(habit.habitName)
//                                    print("testing")
////                                        .getHabitsForCurrentMonth(forDate: <#T##Date#>)
//                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                                        withAnimation (.smooth(duration: 0.1)){
//                                            
//                                            numberOfTasks = Double(getNumberOfTasks(habits: habitsManager.habitsOfASpecificDay))
//                                            numberOfCompletedTasks = Double(getNumberOfCompletedTasks(habits: habitsManager.habitsOfASpecificDay))
//                                            completionRate = (numberOfCompletedTasks / numberOfTasks) * 100
//                                        
//                                            if completionRate == 0.0 {
//                                                progessTitle = stage1
//                                            }
//                                            if completionRate > 0.0  && completionRate <= 25.0 {
//                                                progessTitle = stage2
//                                            }
//                                            if completionRate > 25.0 && completionRate <= 50.0 {
//                                                progessTitle = stage3
//                                            }
//                                            if completionRate > 50.0 && completionRate <= 73.0 {
//                                                progessTitle = stage4
//                                            }
//                                            if completionRate > 73.0 && completionRate <= 90.0 {
//                                                progessTitle = stage5
//                                            }
//                                            
//                                            if completionRate == 100.0 || completionRate > 100.0 {
//                                                progessTitle = stage6
//                                            }
//                                        }
//                                    }
//                                }) {
//                                    Image(systemName: habit.isCompleted ? "checkmark.circle.fill" : "circle")
//                                        .resizable()
//                                        .foregroundColor(purpleColor)
//                                        .frame(width: 20, height: 20)
//                                }
//                                VStack(alignment: .leading, spacing: 4) {
//                                    Text("\(habit.habitName)")
//                                        .font(.system(size: 13))
//                                        .bold()
//                                    if habit.description != "" {
//                                        Text("\(habit.description)")
//                                            .font(.system(size: 10))
//                                            .foregroundStyle(.gray)
//                                    }
//                                }
//                                Spacer()
//                            }
//                        }
//                        ProgressView(value: 1, total: 55)
//                            .opacity(0)
//                    }
//                }
//            }
//        }
//        .padding()
//        .background(.white)
//        .cornerRadius(10)
    }
}

#Preview {
    HabitsAndProgressView()
}
