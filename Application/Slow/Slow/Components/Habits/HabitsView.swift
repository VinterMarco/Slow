//
//  HabitsView.swift
//  Slow
//
//  Created by Vinter Marco on 14.01.2024.
//

import SwiftUI

struct HabitsView: View {
    
    //
    
    var stage1 = "Starting small enhances goal achievement"
    var stage2 = "You have a great start"
    var stage3 = "Great job until now"
    var stage4 = "Keep up the momentum"
    var stage5 = "Last mile"
    var stage6 = "Completed"
    
    @State var progessTitle = ""
    
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
    
    
    //
    let daysOfWeek = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    @State var selectedDate = 13
    @State var isChecked : Bool = false
    @State var numberOfTasks : Double = 3.0
    @State var numberOfCompletedTasks : Double = 1.0
    @State var completionRate : Double = 1.0
    
    // Function to get the start date of the current week
    func getStartOfWeek() -> Date {
        let calendar = Calendar.current
        let now = Date()
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: now))!
        return startOfWeek
    }
    
    // Function to get the date for a specific day of the week
    func getDate(for dayIndex: Int) -> Date {
        let calendar = Calendar.current
        let startOfWeek = getStartOfWeek()
        let date = calendar.date(byAdding: .day, value: dayIndex, to: startOfWeek)!
        return date
    }
    
    //
    @EnvironmentObject var habitsManager : HabitsManager
    
    // test
    
    func getCurrentDay () {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDate = dateFormatter.string(from: currentDate)
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let date = dateFormatter2.date(from: formattedDate) {
            let calendar = Calendar.current
            let day = calendar.component(.day, from: date)
            selectedDate = day
        } else {
            print("Failed to parse the date string")
        }
    }
    
    func formatDates(date: Date) -> Int {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        return day
    }
    
    var purpleColor  = Color(red : 97/255,green : 1/255, blue : 238/255)
    var pinkColor  = Color(red : 255/255,green : 121/255, blue : 201/255)
    
    //
    let fruits = ["Yearly", "Monthly", "Weekly"]
    @State private var selectedFruit = "Weekly"
    //
    
    
    
    var body: some View {
        ZStack {
            Color(red : 248/255, green : 244/255,blue :249/255).ignoresSafeArea()
            VStack {
                HStack {
                    HStack {
                        Text("\(selectedFruit)")
                        Spacer()
                        Image(systemName: "calendar")
                            .foregroundColor(purpleColor)
                        
                    }
                    .font(.system(size: 13))
                    .frame(width: 73 )
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .foregroundColor(purpleColor)
                    .background(purpleColor.opacity(0.09))
                    .cornerRadius(30)
                    .overlay {
                        Picker("Select a fruit", selection: $selectedFruit) {
                            ForEach(fruits, id: \.self) {
                                Text($0)
                            }
                        }
                        .opacity(0.02)
                    }
                    Spacer()
                }
                
                
                if selectedFruit == "Weekly" {
                    
                    
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(0..<daysOfWeek.count) { category in
                                let dayreProcceses = daysOfWeek[category]
                                let day = dayreProcceses
                                let preProcceses = getDate(for: category)
                                let date = formatDates(date: preProcceses)
                                Button {
                                    selectedDate = date
                                    habitsManager.getHabitsForADay(forDay: preProcceses)
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                        numberOfTasks = Double(getNumberOfTasks(habits: habitsManager.habitsOfASpecificDay))
                                        numberOfCompletedTasks = Double(getNumberOfCompletedTasks(habits: habitsManager.habitsOfASpecificDay))
                                        completionRate = (numberOfCompletedTasks / numberOfTasks) * 100
                                        
                                        numberOfTasks = Double(getNumberOfTasks(habits: habitsManager.habitsOfASpecificDay))
                                        
                                        numberOfCompletedTasks = Double(getNumberOfCompletedTasks(habits: habitsManager.habitsOfASpecificDay))
                                        completionRate = (numberOfCompletedTasks / numberOfTasks) * 100
                                        
                                        
                                        
                                        
//                                        var stage1 = "Starting small enhances goal achievement"
//                                        var stage2 = "You have a great start"
//                                        var stage3 = "Great job until now"
//                                        var stage4 = "Keep up the momentum"
//                                        var stage5 = "Last mile"
//                                        var stage6 = "Completed"
                                        
                                        if completionRate == 0.0 {
                                            progessTitle = stage1
                                        }
                                        if completionRate > 0.0 && completionRate <= 25.0 {
                                            progessTitle = stage2
                                        }
                                        if completionRate > 25.0 && completionRate <= 50.0 {
                                            progessTitle = stage3
                                        }
                                        if completionRate > 50.0 && completionRate <= 73.0 {
                                            progessTitle = stage4
                                        }
                                        if completionRate > 73.0 && completionRate <= 90.0 {
                                            progessTitle = stage5
                                        }
                                        
                                        if completionRate == 100.0 || completionRate > 100.0 {
                                            progessTitle = stage6
                                        }
                                    }
                                    
                                } label: {
                                    VStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(date == selectedDate ?  purpleColor : .clear, lineWidth : 0.6)
                                            .fill(date == selectedDate ?  purpleColor.opacity(0.1) : .gray.opacity(0.2))
                                            .frame(width: 50, height: 70)
                                    }
                                    .frame(minWidth: 40)
                                    .overlay {
                                        VStack {
                                            Text("\(day)")
                                                .font(.system(size: 10))
                                                .fontWeight(.regular)
                                            Text("\(date)")
                                                .font(.system(size: 15))
                                                .fontWeight(date == selectedDate ?  .bold : .regular)
                                        }
                                        .foregroundColor(date == selectedDate ? purpleColor : .gray)
                                    }
                                    
                                }
                                
                            }
                        }
                    }
                    if habitsManager.habitsOfASpecificDay.isEmpty {
                            VStack {
                                Spacer()
                                VStack {
                                    Divider()
                                        .overlay(Color.white)
                                    Text("No activities added")
                                        .offset(y : 50)
                                    Image(.databasePic)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 220, height: 300)
                                }
                                Spacer()
                            }
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                        
                    } else {
                        VStack {
                            VStack(alignment : .leading) {
                                HStack {
                                    Text("\(progessTitle)")
                                        .font(.footnote)
                                        .foregroundStyle(.gray)
                                        .offset(y : 10)
                                    Spacer()
                                    Text("\(String(format: "%.1f", completionRate))%")
                                        .font(.footnote)
                                        .foregroundStyle(.gray)
                                        .offset(y : 10)
                                }
                                ProgressView("", value: numberOfCompletedTasks, total: numberOfTasks)
                                    .scaleEffect(y : 2.3)
                                    .offset(y : -10)
                                    .tint(pinkColor)
                            }
                            Divider()
                                .padding(.vertical)
                            
                            VStack  (alignment : .leading){
                                ProgressView("", value: 25, total: 55)
                                    .opacity(0)
                                
                                ScrollView(showsIndicators: false) {
                                    VStack(spacing: 20) {
                                        ForEach(habitsManager.habitsOfASpecificDay, id: \.id) { habit in
                                            HStack(spacing: 20) {
                                                Button(action: {
                                                    habitsManager.updateHabit(habit.documenttName ?? "", isCompleted: !habit.isCompleted)
                                                    habitsManager.getHabits()
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                        numberOfTasks = Double(getNumberOfTasks(habits: habitsManager.habitsOfASpecificDay))
                                                        
                                                        numberOfCompletedTasks = Double(getNumberOfCompletedTasks(habits: habitsManager.habitsOfASpecificDay))
                                                        completionRate = (numberOfCompletedTasks / numberOfTasks) * 100
                                                        
                                                        
                                                        
                                                       
                                                        
                                                        if completionRate == 0.0 {
                                                            progessTitle = stage1
                                                        }
                                                        if completionRate > 0.0  && completionRate <= 25.0 {
                                                            progessTitle = stage2
                                                        }
                                                        if completionRate > 25.0 && completionRate <= 50.0 {
                                                            progessTitle = stage3
                                                        }
                                                        if completionRate > 50.0 && completionRate <= 73.0 {
                                                            progessTitle = stage4
                                                        }
                                                        if completionRate > 73.0 && completionRate <= 90.0 {
                                                            progessTitle = stage5
                                                        }
                                                        
                                                        if completionRate == 100.0 || completionRate > 100.0 {
                                                            progessTitle = stage6
                                                        }
                                                    }
                                                }) {
                                                    Image(systemName: habit.isCompleted ? "checkmark.circle.fill" : "circle")
                                                        .resizable()
                                                        .foregroundColor(purpleColor)
                                                        .frame(width: 20, height: 20)
                                                }
                                                VStack(alignment: .leading, spacing: 4) {
                                                    Text("\(habit.habitName)")
                                                        .font(.system(size: 13))
                                                        .bold()
                                                    if habit.description != "" {
                                                        Text("\(habit.description)")
                                                            .font(.system(size: 10))
                                                            .foregroundStyle(.gray)
                                                    }
                                                }
                                                Spacer()
                                            }
                                        }
                                        ProgressView(value: 1, total: 55)
                                            .opacity(0)
                                    }
                                }
                            }
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                    }
                }
                
                if selectedFruit == "Monthly" {
                    Text("Monthly")
                }
                
                if selectedFruit == "Yearly" {
                    Text("Yearly")
                }
                
              
            }
            .padding()
            .onAppear {
                habitsManager.getHabitsForADay(forDay: Date())
                print(type(of: habitsManager.habitsOfASpecificDay))
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    numberOfTasks = Double(getNumberOfTasks(habits: habitsManager.habitsOfASpecificDay))
                    numberOfCompletedTasks = Double(getNumberOfCompletedTasks(habits: habitsManager.habitsOfASpecificDay))
                    completionRate = (numberOfCompletedTasks / numberOfTasks) * 100
                    
                    if completionRate == 0.0 {
                        progessTitle = stage1
                    }
                    if completionRate > 0.0  && completionRate <= 25.0 {
                        progessTitle = stage2
                    }
                    if completionRate > 25.0 && completionRate <= 50.0 {
                        progessTitle = stage3
                    }
                    if completionRate > 50.0 && completionRate <= 73.0 {
                        progessTitle = stage4
                    }
                    if completionRate > 73.0 && completionRate <= 90.0 {
                        progessTitle = stage5
                    }
                    
                    if completionRate == 100.0 || completionRate > 100.0 {
                        progessTitle = stage6
                    }

                    
                    
                    
                }
                getCurrentDay()
                
            }
        }
    }
}



#Preview {
    HabitsView()
}
