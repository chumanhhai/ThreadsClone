//
//  ContentView.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userSessionManager: UserSessionManager
    
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
            LoginView()
        }
    }
}

#Preview {
    ContentView()
}
