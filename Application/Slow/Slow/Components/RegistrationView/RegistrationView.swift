//
//  RegistrationView.swift
//  Slow
//
//  Created by Vinter Marco on 11.01.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var lastName = ""
    @State private var firstName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel : AuthViewModel
    
    
    var color  = LinearGradient(colors: [ Color(red: 77/255, green: 113/255, blue: 169/255)
, ], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        
        // image
        
        
        
        VStack {
            ZStack {
                VStack {
                    color.ignoresSafeArea()
                    Color.white.ignoresSafeArea()
                }
                VStack {
                    Image(.chill)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 120)
                        .padding(.vertical, 32)
                        .offset(/*@START_MENU_TOKEN@*/CGSize(width: 10.0, height: 10.0)/*@END_MENU_TOKEN@*/)
                        .offset(y: 35)
                        .padding(.bottom, 6)
                    
                    // form fields
                    
                    VStack (spacing: 20 ) {
                        
                        VStack {
                            Text("Sign up")
                                .font(.system(size: 50))
                                .fontDesign(.rounded)
                                .offset(y : 8)

                        }
                        .padding()
                        VStack {
                            InputView(
                                text: $email,
                                title: "Email Address",
                                placeholder: "name@example.com")
                            .autocapitalization(.none)
                            
                            InputView(
                                text: $lastName,
                                title: "Last Name",
                                placeholder: "Enter your last name")
                            
                            InputView(
                                text: $firstName,
                                title: "First Name",
                                placeholder: "Enter your first name")
                            
                            InputView(
                                text: $password,
                                title: "Password",
                                placeholder: "Enter your password",
                                isSecureField: false)
                            .autocapitalization(.none)
                            
                            InputView(
                                text: $confirmPassword,
                                title: "Confirm Password",
                                placeholder: "Cofirm your password",
                                isSecureField: false)
                            .autocapitalization(.none)
                        }
                        .padding(.horizontal)
                        
                        // btns
                        
                        Button {
                            Task {
                                try await viewModel.createUser(withEmail: email,
                                                               password: password,
                                                               firstName: firstName, lastName: lastName)
                            }
                        } label: {
                            HStack {
                                Text("SIGN UP")
                                    .fontWeight(.semibold)
                                Image(systemName: "arrow.right")
                            }
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                        }
                        .background(color)
                        .clipShape(.buttonBorder)
                        .padding(.top, 24)
                        
//                        Spacer()
                        Button {
                            dismiss()
                        } label: {
                            HStack  {
                                Text("Already have an account ?")
                                
                                Text("Sign In")

                                    .fontWeight(.bold)
                            }
                            .foregroundColor(.black)
                            .font(.system(size: 14))
                        }
                        
                    }
                    .frame(width: 400)
                    .background(.white)
                    .cornerRadius(30)
                    .padding(.vertical, 50)
                    .padding(.horizontal)
                    .padding(.top, 12)
                }
            }
        }
    }
}

#Preview {
    RegistrationView()
}
