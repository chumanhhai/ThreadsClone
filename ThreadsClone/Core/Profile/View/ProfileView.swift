//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI

enum ProfileContentFilter: Int, CaseIterable, Identifiable {
    case thread, reply
    
    var title: String {
        switch self {
        case .thread:
            return "Threads"
        case .reply:
            return "Replies"
        }
    }
    
    var id: Int {
        return rawValue
    }
}

struct ProfileView: View {
    @State private var selectedContentFilter: ProfileContentFilter = .thread
    @Namespace var underlineAnimation
    
    var body: some View {
        List {
            // info section
            VStack {
                HStack(alignment: .top, spacing: 12) {
                    VStack(alignment: .leading, spacing: 12) {
                        VStack(alignment: .leading) {
                            Text("Eren Yeager")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text("ancestor_titan")
                                .font(.subheadline)
                        }
                        Text("Formula 1 for driver")
                            .font(.subheadline)
                        Text("2 followers")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray))
                    }
                    Spacer()
                    CircularProfileImageView()
                }
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
                HStack {
                    ForEach(ProfileContentFilter.allCases, id: \.self) { item in
                        Button(action: {
                            withAnimation {
                                selectedContentFilter = item
                            }
                        }, label: {
                            let isSelected = selectedContentFilter == item
                            VStack(spacing: 8) {
                                Text(item.title)
                                    .foregroundStyle(.black)
                                    .fontWeight(isSelected ? .semibold : .regular)
                                if isSelected {
                                    Rectangle()
                                        .foregroundStyle(.black)
                                        .frame(maxWidth: .infinity, minHeight: 2, maxHeight: 2)
                                        .matchedGeometryEffect(id: "underlineAnimation", in: underlineAnimation)
                                } else {
                                    Rectangle()
                                        .foregroundStyle(.clear)
                                        .frame(maxWidth: .infinity, minHeight: 2, maxHeight: 2)
                                }
                            }
                        })
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
            }
            .padding(.horizontal)
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
    }
}

#Preview {
    ProfileView()
}
