//
//  UserProfileContentView.swift
//  ThreadsClone
//
//  Created by Chu Manh Hai on 7/9/24.
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

struct UserProfileContentView: View {
    
    @Binding var contentFilter: ProfileContentFilter
    @Namespace var underlineAnimation
    
    var body: some View {
        VStack {
            HStack {
                ForEach(ProfileContentFilter.allCases, id: \.self) { item in
                    Button(action: {
                        withAnimation {
                            contentFilter = item
                        }
                    }, label: {
                        let isSelected = contentFilter == item
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
            
//            ForEach(0 ... 10, id: \.self) { thread in
//                ThreadCell()
//            }
        }
    }
}

#Preview {
    @State var filter: ProfileContentFilter = .thread
    return UserProfileContentView(contentFilter: $filter)
}
