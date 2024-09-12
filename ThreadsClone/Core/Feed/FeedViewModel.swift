//
//  FeedViewModel.swift
//  ThreadsClone
//
//  Created by henry on 9/10/24.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var threads: [TCThread] = []
    
    @MainActor
    func fetchThreads() async throws {
        let threadService = ThreadService()
        let userService = UserService()
        threads = try await threadService.fetchThreads()
        
        for i in 0 ..< threads.count {
            Task(priority: .background) {
                threads[i].user = try await userService.fetchUserData(withUserId: threads[i].ownerId)
            }
        }
    }
}
