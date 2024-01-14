//
//  AcountView.swift
//  Slow
//
//  Created by Vinter Marco on 14.01.2024.
//

import SwiftUI

struct AcountView: View {
    
    @EnvironmentObject var viewModel : AuthViewModel

    var body: some View {
        ZStack {
            Color(red : 248/255, green : 244/255,blue :249/255).ignoresSafeArea()
            VStack {
                Text("Account view")
                Button("log out") {
                    viewModel.signOut()
                }
            }
        }
    }
}

#Preview {
    AcountView()
}
