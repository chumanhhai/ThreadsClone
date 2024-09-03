//
//  FeedView.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            List(0 ... 10, id: \.self) { thread in
                ThreadCell()
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .refreshable {
                
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundColor(.black)
                    })
                }
            })
        }
    }
}

#Preview {
    FeedView()
}
