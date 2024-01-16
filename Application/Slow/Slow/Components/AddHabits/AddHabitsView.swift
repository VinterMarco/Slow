//
//  AddHabitsView.swift
//  Slow
//
//  Created by Vinter Marco on 14.01.2024.
//

import SwiftUI

struct AddHabitsView: View {
    
    
    @ObservedObject var habitsManager = HabitsManager()

    
    @State  var date : Date = Date.now
    @State  var formattedDate : String = ""
    @State  var isCompleted : Bool = false
    @State  var taskName : String = ""
    @State  var comment : String = ""
    @State private var calendarId: Int = 0
    @State private var selectedCategory: String = "All Categories"
    @State private var displayedSelectedHabits : [String] = Array()
    
    @State private var socialHabitsWithEmojis = [
        "🤝 Networking",
        "🗣️ Effective Communication",
        "🤗 Empathy",
        "🙌 Collaboration",
        "👥 Building Relationships",
        "🤔 Active Listening"
    ]
    
    @State private var allHabits : [String] =   [
        "📚 Reading",
        "🎓 Learning",
        "🎯 Goal Setting",
        "🤔 Continuous Reflection",
        "📓 Journaling",
        "🤝 Networking",
        "🏋️‍♂️ Exercise",
        "🥗 Healthy Eating",
        "😴 Sleeping",
        "🚰 Hydration",
        "🍏 Mindful Eating",
        "🏃‍♀️ Cardiovascular Exercise",
        "🧘‍♂️ Stretching",
        "🥤 Moderation in Intake",
        "🚴‍♀️ Outdoor Activities",
        "🛌 Adequate Rest",
        "⏰ Time Management",
        "📅 Prioritization",
        "✏️ Planning",
        "🚀 Task Execution",
        "🤓 Focus and Concentration",
        "🔄 Adaptability",
        "🧠 Continuous Learning",
        "✅ Setting Milestones",
        "🔄 Review and Reflection",
        "🗣️ Effective Communication",
        "🤗 Empathy",
        "🙌 Collaboration",
        "👥 Building Relationships",
        "🤔 Active Listening",
        "💰 Budgeting",
        "💸 Saving",
        "📊 Financial Planning",
        "📈 Investments",
        "🔄 Frugality",
        "👛 Smart Spending",
        "🧘‍♀️ Mindfulness and Meditation",
        "😌 Positive Thinking",
        "📝 Journaling",
        "🛌 Adequate Sleep",
        "🌟🤝 Support System",
        "🎨 Creative Expression",
        "🎨 Creative Pursuits",
        "🎸 Hobbies",
        "📚 Continuous Learning",
        "🎭 Artistic Expression",
        "📷 Photography"
    ]
    
    @State private var financialHabitsWithEmojis = [
        "💰 Budgeting",
        "💸 Saving",
        "📊 Financial Planning",
        "📈 Investments",
        "🔄 Frugality",
        "👛 Smart Spending"
    ]
    
    @State private var mentalHealthHabitsWithEmojis = [
        "🧘‍♀️ Mindfulness and Meditation",
        "😌 Positive Thinking",
        "📝 Journaling",
        "🛌 Adequate Sleep",
        "🤝 Support System",
        "🎨 Creative Expression"
    ]
    
    @State private var creativityAndHobbiesWithEmojis = [
        "🎨 Creative Pursuits",
        "🎸 Hobbies",
        "📚 Continuous Learning",
        "📝 Journaling",
        "🎭 Artistic Expression",
        "📷 Photography"
    ]
    
    @State private var personalHabits : [String] =   [
        "📚 Reading",
        "🎓 Learning",
        "🎯 Goal Setting",
        "🤔 Continuous Reflection",
        "📓 Journaling",
        "🤝 Networking"
    ]
    
    @State private var allHealthAndFitnessHabitsWithEmojis = [
        "🏋️‍♂️ Exercise",
        "🥗 Healthy Eating",
        "😴 Sleeping",
        "🚰 Hydration",
        "🍏 Mindful Eating",
        "🏃‍♀️ Cardiovascular Exercise",
        "🧘‍♂️ Stretching",
        "🥤 Moderation in Intake",
        "🚴‍♀️ Outdoor Activities",
        "🛌 Adequate Rest"
    ]
    
    @State private var allProductivityHabitsWithEmojis = [
        "⏰ Time Management",
        "📅 Prioritization",
        "📝 Planning",
        "🚀 Task Execution",
        "🤓 Focus and Concentration",
        "🔄 Adaptability",
        "🧠 Continuous Learning",
        "✅ Setting Milestones",
        "🔄 Review and Reflection"
    ]
    
    @State private var habitsCategories: [String] = [
        "All Categories",
        "Personal",
        "Health and Fitness",
        "Productivity",
        "Social",
        "Financial",
        "Mental Health",
        "Creativity",
    ]
    
    
    
    func formatDate (dateString : Date) {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd MMMM, yyyy"
        let formattedDate = outputFormatter.string(from: dateString)
        print(formattedDate)
        self.formattedDate = formattedDate
        
    }
    
    var body: some View {
        ZStack {
            Color(red : 248/255, green : 244/255,blue :249/255).ignoresSafeArea()
            VStack {
                NavigationStack {
                    VStack {
                        TextField("Untitled", text: $taskName)
                            .font(.title).bold()
                            .frame(height: 50)
                            .padding()
                        
                        Divider()
                            .padding(.horizontal)
                        HStack  {
                            HStack{
                                Image(systemName: "calendar")
                                Text("When")
                            }
                            Spacer()
                            Text("\(formattedDate)")
                            Spacer()
                            
                        }
                        .padding()
                        .overlay {
                            HStack (spacing : 0){
                                DatePicker("data", selection: $date,displayedComponents: .date)
                                    .labelsHidden()
                                    .opacity(0.02)
                                    .id(calendarId)
                                    .onChange(of: date) { _ in
                                        calendarId += 1
                                        formatDate(dateString: date)
                                    }
                                DatePicker("data", selection: $date,displayedComponents: .date)
                                    .labelsHidden()
                                    .opacity(0.02)
                                    .id(calendarId)
                                    .onChange(of: date) { _ in
                                        calendarId += 1
                                        formatDate(dateString: date)
                                    }
                                DatePicker("data", selection: $date,displayedComponents: .date)
                                    .labelsHidden()
                                    .opacity(0.02)
                                    .id(calendarId)
                                    .onChange(of: date) { _ in
                                        calendarId += 1
                                        formatDate(dateString: date)
                                    }
                            }
                        }
                        
                        
                        Divider()
                            .padding(.horizontal)
                        
                        VStack {
                            HStack {
                                Circle()
                                    .frame(width: 30, height: 30)
                                TextField("Add a comment...", text: $comment)
                            }
                            .padding()
                        }
                    }
                    .background(.white)
                    .cornerRadius(15)
                    
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(habitsCategories, id : \.self) { category in
                                    Button {
                                        print(category)
                                        selectedCategory = category
                                        if category == "All Categories" {
                                            displayedSelectedHabits = allHabits
                                        }
                                        if category == "Personal" {
                                            displayedSelectedHabits = personalHabits
                                        }
                                        
                                        if category == "Health and Fitness" {
                                            displayedSelectedHabits = allHealthAndFitnessHabitsWithEmojis
                                        }
                                        
                                        if category == "Productivity" {
                                            displayedSelectedHabits = allProductivityHabitsWithEmojis
                                        }
                                        
                                        if category == "Social" {
                                            displayedSelectedHabits = socialHabitsWithEmojis
                                        }
                                        
                                        if category == "Financial" {
                                            displayedSelectedHabits = financialHabitsWithEmojis
                                        }
                                        
                                        if category == "Mental Health" {
                                            displayedSelectedHabits = mentalHealthHabitsWithEmojis
                                        }
                                        
                                        if category == "Creativity" {
                                            displayedSelectedHabits = creativityAndHobbiesWithEmojis
                                        }
                                        
                                    } label: {
                                        Text(category)
                                            .padding(7)
                                            .font(.system(size: 13))
                                            .cornerRadius(30)
                                            .foregroundStyle(selectedCategory == category ? Color(red : 97/255,green : 1/255, blue : 238/255) : .black)
                                            .frame(minWidth: 100)
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 30)
                                                    .stroke(selectedCategory == category ? Color(red : 97/255,green : 1/255, blue : 238/255) : .black,
                                                            lineWidth: 0.9)
                                                    .frame(minWidth: 100)
                                            }
                                            .scrollTransition { content, phase in
                                                content
                                                    .opacity(phase.isIdentity ? 1.0 : 0.3)
                                                    .scaleEffect(
                                                        x : phase.isIdentity ? 1 : 0.3,
                                                        y :phase.isIdentity ? 1 : 0.3 )
                                            }
                                    }
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .scrollTargetBehavior(.viewAligned)
                        .padding()
                        ScrollView() {
                            VStack( alignment : .leading, spacing: 20) {
                                ForEach(displayedSelectedHabits, id : \.self) { habit in
                                    HStack {
                                        Text(habit)
                                            .foregroundStyle(.black)
                                        
                                        Spacer()
                                        
                                        Button {
                                            taskName = habit

                                        } label: {
                                            Image(systemName: "plus")
                                                .foregroundStyle(Color(red : 97/255,green : 1/255, blue : 238/255))
                                        }
                                    }
                                    Divider()
                                }
                            }
                            .padding()
                        }
                        
                        VStack {
                            Button{
                                if comment == "" {
                                    comment = "A step closer to better you"
                                }
                                habitsManager.addHabit(Habit(habitName: taskName, description: comment, date: date, isCompleted: false))
                                taskName = ""
                                comment = ""
                            } label : {
                                Text("ADD HABIT")
                                    .frame(width: 280)
                                    .padding(10)
                                    .background(
                                        taskName == "" ? .gray :
                                        Color(red : 97/255,green : 1/255, blue : 238/255))
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            .disabled(taskName == "" ?  true : false)

                        }
                        .cornerRadius(5)
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(5)
                }
                .onAppear {
                    formatDate(dateString: Date.now)
                    displayedSelectedHabits = allHabits
                }
                .padding()
            }
        }
        .navigationTitle("Add Habits")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    AddHabitsView(date: Date.now, isCompleted: false, taskName: "")
}
