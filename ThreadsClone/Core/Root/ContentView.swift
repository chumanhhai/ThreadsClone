//
//  ContentView.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel
    @ObservedObject var userSessionManager: UserSessionManager
    
    init(withUserSessionManager userSessionManager: UserSessionManager) {
        _viewModel = StateObject(wrappedValue: ContentViewModel(withUserSessionManager: userSessionManager))
        _userSessionManager = ObservedObject(wrappedValue: userSessionManager)
    }
    
    var body: some View {
        let isLoggedIn = userSessionManager.userSession != nil
        let isRequiredDataAvailable = userSessionManager.user != nil
        if isLoggedIn {
            if isRequiredDataAvailable {
                ThreadsTabBarView()
            } else {
                TCSplashView()
            }
        } else {
            LoginView(withUserSessionManager: userSessionManager)
        }
    }
}

#Preview {
    ContentView(withUserSessionManager: UserSessionManager())
}
