//
//  ContentView.swift
//  Slow
//
//  Created by Vinter Marco on 11.01.2024.
//

import SwiftUI


@MainActor
struct ContentView: View {
    @EnvironmentObject var viewModel : AuthViewModel
//    @EnvironmentObject var habitsManager : HabitsView

    
    @State var selectedTab = "habits"
    var body: some View {
        
        if viewModel.userSession == nil {
            LoginView()
        } else {
            NavigationStack {
                VStack {
                    if selectedTab == "habits" {
                        HabitsView()
                    }
                    if selectedTab == "stats" {
                        StatsView()
                    }
                    if selectedTab == "inspiration" {
                        InspirationView()
                    }
                    if selectedTab == "account" {
                        AcountView()
                    }
                    
                    Spacer()
                    
                    CustomTabBar(selectdTab: $selectedTab)
                }
                
                .background(Color(red : 248/255, green : 244/255,blue :249/255))
            }
        }
    }
}

#Preview {
    ContentView()
}
