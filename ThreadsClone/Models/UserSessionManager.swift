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
        registerListeners()
    }
    
    private func registerListeners() {
        _ = Auth.auth().addStateDidChangeListener { [weak self] auth, userSession in
            self?.userSession = userSession
            if userSession == nil { // sign out
                self?.user = nil
            }
        }
    }
}
