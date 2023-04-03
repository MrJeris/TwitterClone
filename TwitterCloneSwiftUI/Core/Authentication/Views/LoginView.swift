//
//  LoginView.swift
//  TwitterCloneSwiftUI
//
//  Created by MrJeris on 03.04.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        //Родительский контейнер
        VStack {
            //Header view
            AuthHeaderView(title1: "Hello.", title2: "Welcome Back")
            
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope",
                                 placeHolderText: "Email",
                                 text: $email)
                
                CustomInputField(imageName: "lock",
                                 placeHolderText: "Password",
                                 text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("Reset password view...")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing, 24)
                }

            }
            
            Button {
                print("Sign in here...")
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
            }
            .shadow(color: .gray.opacity(0.5), radius: 10)
            
            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .toolbar(.hidden)
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemBlue))

        }
        .ignoresSafeArea()
        .toolbar(.hidden)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
