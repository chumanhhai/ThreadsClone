//
//  FeedView.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    @State var isFirstTimeEnter = true
    
    var body: some View {
        NavigationStack {
            List(viewModel.threads, id: \.self) { thread in
                ThreadCell(thread: thread)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .refreshable {
                Task {
                    try await viewModel.fetchThreads()
                }
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        Task {
                            try await viewModel.fetchThreads()
                        }
                    }, label: {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundColor(.black)
                    })
                }
            })
            .onAppear {
                if isFirstTimeEnter {
                    isFirstTimeEnter = false
                    Task {
                        try await viewModel.fetchThreads()
                    }
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
