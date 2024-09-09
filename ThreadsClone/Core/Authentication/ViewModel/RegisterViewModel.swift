//
//  RegisterViewModel.swift
//  ThreadsClone
//
//  Created by henry on 9/5/24.
//

import Foundation
import FirebaseAuth

class RegisterViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    private var userSessionManager: UserSessionManager
    
    init(withUserSessionManager userSessionManager: UserSessionManager) {
        self.userSessionManager = userSessionManager
    }
    
    @MainActor
    func createUser() async throws {
        let service = AuthService()
        let user = try await service.register(withEmail: email,
                                              password: password,
                                              fullname: fullname,
                                              username: username)
        userSessionManager.user = user
    }
}
