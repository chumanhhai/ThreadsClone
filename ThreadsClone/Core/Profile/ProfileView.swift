//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI



struct ProfileView: View {
    @EnvironmentObject var userSessionManager: UserSessionManager
    @State var isEditProfilePresented = false
    @State var selectedProfileImage: Image?
    private var user: TCUser? {
        userSessionManager.user
    }
    
    var body: some View {
        NavigationStack {
            List {
                // info section
                VStack {
                    if let user = user {
                        UserProfileHeaderView(user: user)
                    }
                    
                    Button(action: {
                        isEditProfilePresented = true
                    }, label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity, minHeight: 36, maxHeight: 36)
                            .background(.white)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineWidth: 1)
                            }
                            .padding(.vertical)
                    })
                }
                .padding(.horizontal)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                
                UserProfileContentView()
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                
                ForEach(0 ... 10, id: \.self) { thread in
                    ThreadCell()
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem {
                    Button {
                        let service = AuthService()
                        try? service.logout()
                    } label: {
                        Text("Sign Out")
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                    }

                }
            }
            .sheet(isPresented: $isEditProfilePresented) {
                EditProfileView(selectedImage: $selectedProfileImage)
            }
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(UserSessionManager())
}
