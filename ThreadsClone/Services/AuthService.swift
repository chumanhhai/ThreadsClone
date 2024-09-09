//
//  AuthService.swift
//  ThreadsClone
//
//  Created by henry on 9/5/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    
    func login(withEmail email: String, password: String) async throws -> TCUser {
        // login
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        
        // fetch user data
        let service = UserService()
        let user = try await service.fetchUserData(withUserId: result.user.uid)
        
        return user
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) async throws -> TCUser {
        // register
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        
        // upload user data
        let user = TCUser(id: result.user.uid, email: email, fullname: fullname, username: username, bio: nil, profileImage: nil)
        try await uploadUserData(user)
        
        return user
    }
    
    func logout() throws {
        try Auth.auth().signOut()
    }
    
    private func uploadUserData(_ user: TCUser) async throws {
        let userData = try Firestore.Encoder().encode(user)
        try await Firestore.firestore().collection("users").document(user.id).setData(userData)
    }
    
}
