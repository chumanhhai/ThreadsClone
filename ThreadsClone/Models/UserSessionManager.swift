//
//  UserSessionManager.swift
//  ThreadsClone
//
//  Created by henry on 9/5/24.
//

import Foundation
import FirebaseAuth

class UserSessionManager: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User? = Auth.auth().currentUser
    @Published var user: TCUser?
    
    init() {
        Task {
            await registerListeners()
        }
    }
    
    @MainActor
    private func registerListeners() {
        _ = Auth.auth().addStateDidChangeListener { [weak self] auth, userSession in
            self?.userSession = userSession
            // fetch user data
            if let userSession = userSession {
                let userService = UserService()
                Task { [weak self] in
                    do {
                        self?.user = try await userService.fetchUserData(withUserId: userSession.uid)
                    } catch {
                        print("DEBUG: \(error.localizedDescription)")
                    }
                    
                }
            }
        }
    }
}
