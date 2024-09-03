//
//  SearchView.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List(0...10, id: \.self) { user in
                VStack(spacing: 8) {
                    UserCell()
                        .padding()
                    Divider()
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .searchable(text: $searchText)
            .navigationTitle("Search")
        }
    }
}

#Preview {
    SearchView()
}
