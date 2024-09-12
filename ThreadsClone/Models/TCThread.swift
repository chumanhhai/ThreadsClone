//
//  TCThread.swift
//  ThreadsClone
//
//  Created by henry on 9/10/24.
//

import Foundation
import Firebase

struct TCThread: Codable, Hashable {
    let id: String
    let ownerId: String
    let caption: String
    let createdAt: Timestamp
    var likes: Int
    
    var user: TCUser?
}
