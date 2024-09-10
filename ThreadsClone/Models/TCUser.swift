//
//  TCUser.swift
//  ThreadsClone
//
//  Created by henry on 9/6/24.
//

import Foundation

struct TCUser: Codable, Hashable {
    let id: String
    var email: String
    var fullname: String
    var username: String
    var bio: String?
    var link: String?
    var isPrivacyProfileOn: Bool = false
    var profileImage: String?
}
