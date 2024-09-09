//
//  SearchView.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var viewModel = SearchViewModel()
    @State private var isFirstTimeEnter = true
    @EnvironmentObject var userSessionManager: UserSessionManager
    
    var body: some View {
        NavigationStack {
            List(viewModel.users, id: \.self) { user in
                NavigationLink {
                    OtherUserProfileView(user: user)
                } label: {
                    VStack(spacing: 8) {
                        UserCell(user: user)
                            .padding()
                        Divider()
                    }
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)

            }
            .listStyle(.plain)
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Search")
            .onAppear {
                if isFirstTimeEnter {
                    isFirstTimeEnter = false
                    Task {
                        do {
                            try await self.viewModel.fetchUserList(currentUserId: userSessionManager.user?.id ?? "")
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
    SearchView()
        .environmentObject(UserSessionManager())
}
