//
//  PreviewMockData.swift
//  ThreadsClone
//
//  Created by Chu Manh Hai on 7/9/24.
//

import Foundation
import Firebase

enum PreviewMockData {
    static let user = TCUser(id: "id", email: "test@spam4.me", fullname: "Test full name", username: "test_username", bio: "I love coding so much", profileImage: "https://www.chinadaily.com.cn/celebrity/img/attachement/jpg/site1/20150104/001ec97909631612e04350.jpg")
    static let thread = TCThread(id: "id", ownerId: "id", caption: "I love coding so much", createdAt: Timestamp(), likes: 0)
}
