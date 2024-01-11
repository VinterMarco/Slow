//
//  LoginView.swift
//  Slow
//
//  Created by Vinter Marco on 11.01.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var firstName : String = ""
    @State private var lastName : String = ""
    @State private var password : String = ""
    @State private var email : String = ""

    @EnvironmentObject var viewModel : AuthViewModel

    var body: some View {
        TextField("last name", text: $lastName)
        TextField("first name", text: $firstName)
        TextField("password", text: $password)
        TextField("email", text: $email)
        Button("create user") {
            Task {
                try await viewModel.createUser(withEmail: email, password: password, firstName: firstName, lastName: lastName)
            }
        }
    }
}

#Preview {
    LoginView()
}
