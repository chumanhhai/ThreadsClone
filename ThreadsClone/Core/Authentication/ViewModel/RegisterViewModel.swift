//
//  RegisterViewModel.swift
//  ThreadsClone
//
//  Created by henry on 9/5/24.
//

import Foundation
import FirebaseAuth

class RegisterViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    
    @discardableResult
    func createUser() async throws -> TCUser {
        let service = AuthService()
        return try await service.register(withEmail: email,
                                          password: password,
                                          fullname: fullname,
                                          username: username)
    }
}
