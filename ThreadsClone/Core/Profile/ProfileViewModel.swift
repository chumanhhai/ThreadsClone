//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by henry on 9/9/24.
//

import Foundation
import PhotosUI
import SwiftUI
import Combine

class ProfileViewModel: ObservableObject {
    @Published var contentFilter: ProfileContentFilter = .thread
    @Published var threads: [TCThread] = []
    
    @MainActor
    func fetchThreads(forUser user: TCUser) async throws {
        let threadService = ThreadService()
        let userService = UserService()
        threads = try await threadService.fetchThreads(forUser: user)
    }
    
}
