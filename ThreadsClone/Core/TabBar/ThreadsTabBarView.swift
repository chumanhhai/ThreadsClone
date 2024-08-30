//
//  ThreadsTabBarView.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI

enum ThreadsTabBarItem: Int, CaseIterable, Identifiable {
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
    
    var body: some View {
        return TabView(selection: $selectedTab) {
            ForEach(ThreadsTabBarItem.allCases, id: \.self) { item in
                item.view
                    .tabItem {
                        Image(systemName: item.image)
                    }
                    .onAppear {
                        selectedTab = item
                    }
            }
        }
        .tint(.black)
    }
}

#Preview {
    ThreadsTabBarView()
}
