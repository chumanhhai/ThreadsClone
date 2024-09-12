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
    @StateObject var viewModel = ProfileViewModel()
    @State var isFirstTimeAppear = true
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
                
                UserProfileContentView(contentFilter: $viewModel.contentFilter)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                
                switch viewModel.contentFilter {
                case .thread:
                    ForEach(viewModel.threads, id: \.self) { thread in
                        ThreadCell(thread: thread)
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                    }
                case .reply:
                    Text("No results")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
            .navigationBarTitleDisplayMode(.inline)
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
                EditProfileView(withUserSessionManager: userSessionManager)
            }
            .onAppear {
                if isFirstTimeAppear {
                    isFirstTimeAppear = false
                    Task {
                        do {
                            if let user = user {
                                try await viewModel.fetchThreads(forUser: user)
                            }
                        } catch {
                            print("DEBUG: \(error.localizedDescription)")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(UserSessionManager())
}
