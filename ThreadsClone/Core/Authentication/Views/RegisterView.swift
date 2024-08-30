//
//  RegisterView.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @Environment(\.dismiss) var dismiss
    
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
                    TextField("Enter your email", text: $email)
                        .autocapitalization(.none)
                        .modifier(TCTextFieldModifier())
                    
                    SecureField("Enter your password", text: $password)
                        .modifier(TCTextFieldModifier())
                    
                    TextField("Enter your first name", text: $firstName)
                        .autocapitalization(.none)
                        .modifier(TCTextFieldModifier())
                    
                    TextField("Enter your last name", text: $lastName)
                        .autocapitalization(.none)
                        .modifier(TCTextFieldModifier())
                }
                
                Button {
                    
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
