//
//  LoginViewModel.swift
//  ThreadsClone
//
//  Created by henry on 9/5/24.
//

import Foundation

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @discardableResult
    func login() async throws -> FirebaseAuth.User {
        let service = AuthService()
        return try await service.login(withEmail: email,
                                       password: password)
    }
}
