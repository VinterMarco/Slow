//
//  YearHabitsView.swift
//  Slow
//
//  Created by Vinter Marco on 18.01.2024.
//

import SwiftUI

struct YearHabitsView: View {
    
    // ======================================================================
    
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
    
    // good code bellow
    

    let numberOfYears: Double = 1
      
      var yearsList: [Date] {
          var result: [Date] = []
          let calendar = Calendar.current
          let now = Date()

          if let oneYearBack = calendar.date(byAdding: .year, value: -Int(numberOfYears), to: now) {
              result.append(oneYearBack)
          }

          result.append(now)

          if let oneYearAhead = calendar.date(byAdding: .year, value: Int(numberOfYears), to: now) {
              result.append(oneYearAhead)
          }

          return result
      }
    
    var formattedYears : [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return yearsList.map { dateFormatter.string(from: $0) }
    }
    
    @State var selectedYear : String  = ""
    
    
    
    
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
    
    
    
    
    @State var selectedDate = "Jan"
    let monthOfTheYear : [String]
    @State var test : [Date] = Array<Date>()
    @State var testFormated : [String]
    
    
    
   
    func getHabitsPerMonth(selectedDate: String) {
        let currentYear = Calendar.current.component(.year, from: Date())
        let dateString = "\(selectedDate) \(currentYear)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        if let date = dateFormatter.date(from: dateString) {
            habitsManager.getHabitsForCurrentMonth(forDate: date)
        }
    }
 
    
    func createDateArrayForMonths() -> [Date] {
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: Date())
        var dateArray: [Date] = []
        
        for month in 1...12 {
            var dateComponents = DateComponents()
            dateComponents.year = currentYear
            dateComponents.month = month
            dateComponents.day = 1
            
            if let firstDayOfMonth = calendar.date(from: dateComponents) {
                dateArray.append(firstDayOfMonth)
            }
        }
        
        return dateArray
    }
    
    
    
    
    
    
    func transformDateToThreeCharString(from date: Date) -> String? {
        print("testttttt")
        print(date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"  // Use "MMM" for three-letter month abbreviation
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: date)
        
        if let month = components.month {
            let monthAbbreviation = dateFormatter.string(from: date)
            return monthAbbreviation
        } else {
            return nil
        }
    }
    
    
    
    
    
    // ======================================================================
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(formattedYears , id: \.self) { category in
                        Button {
                            selectedYear = category
//                            selectedDate = category
                            print("========== [ \(selectedYear) ] ==========")
                            
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "yyyy"

                            if let yearDate = dateFormatter.date(from: selectedYear) {
                                print("Date object for \(selectedYear): \(yearDate)")
                                // aici facem call-ul
                                habitsManager.getHabitsForCurrentYear(forDate: yearDate)
                            } else {
                                print("Invalid date string")
                            }
                            
                            
                            
//                            getHabitsPerMonth(selectedDate: selectedDate)
                            
                            
                            
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                withAnimation (.smooth(duration: 0.1)){
                                    
                                    numberOfTasks = Double(getNumberOfTasks(habits: habitsManager.habitsForCurrentYear))
                                    numberOfCompletedTasks = Double(getNumberOfCompletedTasks(habits: habitsManager.habitsForCurrentYear))
                                    completionRate = (numberOfCompletedTasks / numberOfTasks) * 100
                                    numberOfTasks = Double(getNumberOfTasks(habits: habitsManager.habitsForCurrentYear))
                                    numberOfCompletedTasks = Double(getNumberOfCompletedTasks(habits: habitsManager.habitsForCurrentYear))
                                    completionRate = (numberOfCompletedTasks / numberOfTasks) * 100
                                    
                                    
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
                            }
                            
                        } label: {
                            VStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(category == selectedYear ?  purpleColor : .clear, lineWidth : 0.6)
                                    .fill(category == selectedYear ?  purpleColor.opacity(0.1) : .gray.opacity(0.2))
                                    .frame(width: 80, height: 50)
                                
                            }
                            .frame(minWidth: 40)
                            
                            .overlay {
                                VStack {
                                    Text("\(category)")
                                        .font(.system(size: 20))
                                        .fontWeight(.regular)
                                    
                                }
                                
                                .foregroundColor(category == selectedDate ? purpleColor : .gray)
                                .foregroundColor( .gray)
                                .frame(width: 100, height: 80)
                                
                            }
                            
                            
                        }
                        
                    }
                }
            }
            
            VStack {
                if !habitsManager.habitsForCurrentYear.isEmpty {
                    
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
                            ProgressView("", value: numberOfCompletedTasks, total: numberOfTasks)
                                .opacity(0)
                            
                            ScrollView(showsIndicators: false) {
                                VStack(spacing: 20) {
                                    ForEach(habitsManager.habitsForCurrentYear, id: \.id) { habit in
                                        HStack(spacing: 20) {
                                            Button(action: {
                                                if selectedYear == formattedYears[1] {
                                                    
                                                    habitsManager.updateHabit(habit.documenttName ?? "", isCompleted: !habit.isCompleted)
                                                }
                                                print(" ========== [ \(habit.habitName) ] ==========")
                                                
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                    
                                                    withAnimation (.smooth(duration: 0.1)){
                                                        
                                                        numberOfTasks = Double(getNumberOfTasks(habits: habitsManager.habitsForCurrentYear))
                                                        
                                                        numberOfCompletedTasks = Double(getNumberOfCompletedTasks(habits: habitsManager.habitsForCurrentYear))
                                                        
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
                                                }
                                            }) {
                                                
                                                if selectedYear != formattedYears[1] {
                                                  
                                                    Image(systemName:  habit.isCompleted ? "checkmark.circle.fill" : "circle")
                                                        .resizable()
                                                        .foregroundColor( habit.isCompleted ? .green : .gray)
                                                        .frame(width: 20, height: 20)
                                                        .disabled(true)
                                                } else {
                                                    Image(systemName:  habit.isCompleted ? "checkmark.circle.fill" : "circle")
                                                        .resizable()
                                                        .foregroundColor(purpleColor)
                                                        .frame(width: 20, height: 20)
                                                }
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
                } else {
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
                }
            }
        }
        .onAppear {
            // good code
            selectedYear = formattedYears[1]
            //
            test = createDateArrayForMonths()
            testFormated = []
            print(yearsList)
            print(formattedYears)
            for elem in test {
                testFormated.append(transformDateToThreeCharString(from: elem) ?? "")
            }
            getHabitsPerMonth(selectedDate: "Jan")
            habitsManager.getHabitsForCurrentYear(forDate: yearsList[1])
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                
                withAnimation (.smooth(duration: 0.1)){
                    numberOfTasks = Double(getNumberOfTasks(habits: habitsManager.habitsForCurrentMonth))
                    numberOfCompletedTasks = Double(getNumberOfCompletedTasks(habits: habitsManager.habitsForCurrentMonth))
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
            }
            
            
            
        }
    }
}

#Preview {
    YearHabitsView(monthOfTheYear: [""], testFormated: [""])
}
