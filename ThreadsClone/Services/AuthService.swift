//
//  AuthService.swift
//  ThreadsClone
//
//  Created by henry on 9/5/24.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    func login(withEmail email: String, password: String) async throws -> FirebaseAuth.User {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        print("DEBUG: Sign in user \(result.user.uid)")
        return result.user
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) async throws -> FirebaseAuth.User {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        print("DEBUG: Created user \(result.user.uid)")
        return result.user
    }
    
    func logout() throws {
        try Auth.auth().signOut()
    }
    
}
