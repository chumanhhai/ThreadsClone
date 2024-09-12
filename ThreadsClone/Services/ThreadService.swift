//
//  ThreadService.swift
//  ThreadsClone
//
//  Created by henry on 9/10/24.
//

import Foundation
import FirebaseFirestore

struct ThreadService {
    
    func uploadThread(_ thread: TCThread) async throws {
        let threadData = try Firestore.Encoder().encode(thread)
        try await Firestore.firestore().collection("threads").document(thread.id).setData(threadData)
    }
    
    func fetchThreads() async throws -> [TCThread] {
        let snapshot = try await Firestore.firestore().collection("threads").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: TCThread.self) })
    }
    
    func fetchThreads(forUser user: TCUser) async throws -> [TCThread] {
        let snapshot = try await Firestore.firestore().collection("threads").whereField("ownerId", isEqualTo: user.id).order(by: "createdAt", descending: true).getDocuments()
        return snapshot.documents.compactMap({
            var thread = try? $0.data(as: TCThread.self)
            thread?.user = user
            return thread
        })
    }
    
}
