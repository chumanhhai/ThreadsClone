//
//  RegisterView.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var userSessionManager: UserSessionManager
    
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
                    
                    TextField("Enter your full name", text: $viewModel.fullname)
                        .autocapitalization(.none)
                        .modifier(TCTextFieldModifier())
                    
                    TextField("Enter your username", text: $viewModel.username)
                        .autocapitalization(.none)
                        .modifier(TCTextFieldModifier())
                }
                
                Button {
                    Task {
                        do {
                            let user = try await viewModel.createUser()
                            userSessionManager.user = user
                        } catch {
                            print("DEBUG: \(error.localizedDescription)")
                        }
                    }
                } label: {
                    Text("Sign up")
                        .modifier(TCPrimaryButtonModifier())
                }
                
                Spacer()
                
                Divider()
                
                HStack(spacing: 8) {
                    Text("Already have an account?")
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Sign in")
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
    RegisterView()
}
