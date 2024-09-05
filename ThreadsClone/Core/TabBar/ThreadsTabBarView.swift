//
//  ThreadsTabBarView.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI

enum ThreadsTabBarItem: Int, CaseIterable, Identifiable, Equatable {
    case home, search, createThread, activity, profile
    
    var id: Int {
        rawValue
    }
    
    var image: String {
        switch self {
        case .home:
            return "house"
        case .search:
            return "magnifyingglass"
        case .createThread:
            return "plus"
        case .activity:
            return "heart"
        case .profile:
            return "person"
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .home:
            FeedView()
        case .search:
            SearchView()
        case .createThread:
            CreateThreadView()
        case .activity:
            ActivityView()
        case .profile:
            ProfileView()
        }
    }
}

struct ThreadsTabBarView: View {
    @State private var selectedTab: ThreadsTabBarItem = .home
    @State private var previousTab: ThreadsTabBarItem = .home
    @State private var showCreateThread = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(ThreadsTabBarItem.allCases, id: \.self) { item in
                item.view
                    .tabItem {
                        Image(systemName: item.image)
                    }
            }
        }
        .tint(.black)
        .onChange(of: selectedTab) { _ in
            if selectedTab == .createThread {
                selectedTab = previousTab
                showCreateThread = true
            } else {
                previousTab = selectedTab
            }
        }
        .sheet(isPresented: $showCreateThread, onDismiss: {
            showCreateThread = false
        }, content: {
            CreateThreadView()
        })
    }
}

#Preview {
    ThreadsTabBarView()
}
