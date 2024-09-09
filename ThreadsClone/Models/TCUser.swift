//
//  TCUser.swift
//  ThreadsClone
//
//  Created by henry on 9/6/24.
//

import Foundation

struct TCUser: Codable, Hashable {
    let id: String
    let email: String
    let fullname: String
    let username: String
    let bio: String?
    let profileImage: String?
}
