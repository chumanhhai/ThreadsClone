//
//  ContentViewModel.swift
//  ThreadsClone
//
//  Created by Chu Manh Hai on 7/9/24.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    
    private var initDataDidLoad = false
    private let userSessionManager: UserSessionManager
    private var cancellables = Set<AnyCancellable>()
    
    init(withUserSessionManager userSessionManager: UserSessionManager) {
        self.userSessionManager = userSessionManager
        setupObservers()
    }
    
    private func setupObservers() {
        userSessionManager.$userSession.sink { [weak self] userSession in
            guard let self = self else { return }
            if !initDataDidLoad,
               let userSession = userSession {
                Task { [weak self] in
                    await self?.fetchInitData(withUserId: userSession.uid)
                }
            }
        }
        .store(in: &cancellables)
    }
    
    @MainActor
    private func fetchInitData(withUserId userId: String) async {
        let service = UserService()
        do {
            userSessionManager.user = try await service.fetchUserData(withUserId: userId)
            initDataDidLoad = true
        } catch {
            print("DEBUG: \(error.localizedDescription)")
            userSessionManager.userSession = nil
        }
    }
    
}
