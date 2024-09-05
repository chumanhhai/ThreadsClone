//
//  LoginView.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @EnvironmentObject var userSession: UserSession
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image("ic_threads_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(TCTextFieldModifier())
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(TCTextFieldModifier())
                }
                
                NavigationLink {
                    Text("Forgot password")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.vertical)
                        .padding(.trailing, 24)
                }
                
                Button {
                    Task {
                        do {
                            try await viewModel.login()
                        } catch {
                            print("DEBUG: \(error.localizedDescription)")
                        }
                    }
                } label: {
                    Text("Login")
                        .modifier(TCPrimaryButtonModifier())
                }
                
                Spacer()
                
                Divider()
                
                HStack(spacing: 8) {
                    Text("Don't have an account?")
                    
                    NavigationLink {
                        RegisterView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                }
                .foregroundColor(.black)
                .padding(.vertical)
                
                
            }
        }
    }
}

#Preview {
    LoginView()
}
