//
//  ContentView.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userSession: UserSession
    
    var body: some View {
        if userSession.user == nil {
            LoginView()
        } else {
            ThreadsTabBarView()
        }
    }
}

#Preview {
    ContentView()
}
