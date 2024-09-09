//
//  LoginViewModel.swift
//  ThreadsClone
//
//  Created by henry on 9/5/24.
//

import Foundation

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    private var userSessionManager: UserSessionManager
    
    init(withUserSessionManager userSessionManager: UserSessionManager) {
        self.userSessionManager = userSessionManager
    }
    
    func login() async throws {
        let service = AuthService()
        let user =  try await service.login(withEmail: email,
                                            password: password)
        userSessionManager.user = user
    }
}
