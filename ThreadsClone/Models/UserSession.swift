//
//  UserSession.swift
//  ThreadsClone
//
//  Created by henry on 9/5/24.
//

import Foundation
import FirebaseAuth

class UserSession: ObservableObject {
    
    @Published var user: FirebaseAuth.User? = Auth.auth().currentUser
    
    init() {
        registerListeners()
    }
    
    private func registerListeners() {
        _ = Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            self?.user = Auth.auth().currentUser
        }

    }
}
