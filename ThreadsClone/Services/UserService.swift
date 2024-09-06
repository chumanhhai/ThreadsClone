//
//  UserService.swift
//  ThreadsClone
//
//  Created by henry on 9/6/24.
//

import Foundation
import FirebaseFirestore

struct UserService {
    
    func fetchUserData(withUserId id: String) async throws -> TCUser {
        let result = try await Firestore.firestore().collection("users").document(id).getDocument()
        return try result.data(as: TCUser.self)
    }
    
}
