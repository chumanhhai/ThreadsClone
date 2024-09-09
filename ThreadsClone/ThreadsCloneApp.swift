//
//  ThreadsCloneApp.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct ThreadsCloneApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var userSessionManager = UserSessionManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView(withUserSessionManager: userSessionManager)
                .environmentObject(userSessionManager)
                .preferredColorScheme(.light) // Force light mode
        }
    }
}
