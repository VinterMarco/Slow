//
//  SlowApp.swift
//  Slow
//
//  Created by Vinter Marco on 11.01.2024.
//

import SwiftUI
import Firebase



    
@main
struct SlowApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    @StateObject var habitsManager = HabitsManager()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(habitsManager)
        }
    }
}
