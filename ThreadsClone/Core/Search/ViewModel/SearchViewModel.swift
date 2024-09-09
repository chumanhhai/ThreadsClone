//
//  SearchViewModel.swift
//  ThreadsClone
//
//  Created by Chu Manh Hai on 7/9/24.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var searchText = ""
    @Published var users: [TCUser] = []
    
    @MainActor
    func fetchUserList(currentUserId userId: String) async throws {
        let service = UserService()
        users = try await service.fetchUserList().filter { $0.id != userId }
    }
    
}
