//
//  OtherUserProfileView.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI

struct OtherUserProfileView: View {
    let user: TCUser
    
    var body: some View {
        NavigationStack {
            List {
                // info section
                VStack {
                    UserProfileHeaderView(user: user)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, minHeight: 36, maxHeight: 36)
                            .background(.black)
                            .cornerRadius(8)
                            .padding(.vertical)
                    })
                }
                .padding(.horizontal)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                
                UserProfileContentView()
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                
                ForEach(0 ... 10, id: \.self) { thread in
                    ThreadCell()
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(UserSessionManager())
}
