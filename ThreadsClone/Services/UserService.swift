//
//  UserService.swift
//  ThreadsClone
//
//  Created by henry on 9/6/24.
//

import Foundation
import FirebaseFirestore

class UserService {
    
    func fetchUserData(withUserId id: String) async throws -> TCUser {
        let result = try await Firestore.firestore().collection("users").document(id).getDocument()
        return try result.data(as: TCUser.self)
    }
    
    func fetchUserList() async throws -> [TCUser] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: TCUser.self) })
    }
    
    func uploadProfileImage(forUserId userId: String, imageUrl: String) async throws {
        try await Firestore.firestore().collection("users").document(userId).updateData(["profileImage": imageUrl])
    }

}
