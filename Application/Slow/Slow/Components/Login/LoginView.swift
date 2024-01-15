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
    
    
    var color  = LinearGradient(colors: [Color(red : 97/255,green : 1/255, blue : 238/255)
, ], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        NavigationStack {
            ZStack {
//                AuthBackground()
                VStack {
                    color.ignoresSafeArea()
                    Color.white.ignoresSafeArea()
                }
                VStack {
                    // image
                    Image(.logo2)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 70)
                        .padding(.vertical, 32)
                        .offset(/*@START_MENU_TOKEN@*/CGSize(width: 10.0, height: 10.0)/*@END_MENU_TOKEN@*/)
                        .offset(y: -23)
                        .padding(.bottom, 6)
                    
                    // form fields
                    
                    VStack  (spacing : 20){
                        Text("Login")
                            .font(.system(size: 50))
                            .fontDesign(.rounded)
//                Spacer()
                        VStack (spacing: 24 ) {
                            InputView(
                                text: $email,
                                title: "Email Address",
                                placeholder: "name@example.com")
                            .autocapitalization(.none)
                            
                            
                            InputView(
                                text: $password,
                                title: "Password",
                                placeholder: "Enter your password",
                                isSecureField: true)
                            .autocapitalization(.none)
                            
                        }
                        .padding(.horizontal)
//                        .padding(.top, 12)
                        
                        
                        
                        // sign in btn
                        
                        Button {
                            Task {
                                try await viewModel.signIn(withEmail: email, password: password)
                            }
                        } label: {
                            HStack {
                                Text("SIGN IN")
                                    .fontWeight(.semibold)
                                Image(systemName: "arrow.right")
                            }
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                        }
                        .background(color)
                        .clipShape(.buttonBorder)
                        .padding(.top, 24)
                        
                        
                        // sign up btn
                        NavigationLink {
                            RegistrationView()
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            HStack (spacing : 5) {
                                Text("Don't have an account?")
                                Text("Sign up")
                                    .fontWeight(.bold)
                            }
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                        }
                    }
                    .frame(height: 390)
                    .background(.white)
                    .cornerRadius(30)

                }
            }
        }
    }
}

#Preview {
    LoginView()
}
