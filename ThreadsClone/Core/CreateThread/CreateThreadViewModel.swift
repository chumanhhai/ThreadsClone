//
//  CreateThreadViewModel.swift
//  ThreadsClone
//
//  Created by henry on 9/10/24.
//

import Foundation
import Firebase

class CreateThreadViewModel: ObservableObject {
    
    @Published var caption = ""
    
    func updateThread(forUserId userId: String) async throws {
        let threadService = ThreadService()
        let thread = TCThread(id: UUID().uuidString, ownerId: userId, caption: caption, createdAt: Timestamp(), likes: 0)
        try await threadService.uploadThread(thread)
    }
    
}
