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
    var body: some View {
        
        if viewModel.userSession == nil {
            LoginView()
        } else {
            Text("App Content")
            Button("log out") {
                viewModel.signOut()
            }
        }
    }
}

#Preview {
    ContentView()
}
