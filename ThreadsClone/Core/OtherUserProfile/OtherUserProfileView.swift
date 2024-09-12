//
//  OtherUserProfileView.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI

struct OtherUserProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    @State var isFirstTimeAppear = true
    let user: TCUser
    
    var body: some View {
        NavigationStack {
            List {
                // info section
                VStack {
                    UserProfileHeaderView(user: user)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, minHeight: 36, maxHeight: 36)
                            .background(.black)
                            .cornerRadius(8)
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
            .onAppear {
                if isFirstTimeAppear {
                    isFirstTimeAppear = false
                    Task {
                        do {
                            try await viewModel.fetchThreads(forUser: user)
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
