//
//  ThreadCell.swift
//  ThreadsClone
//
//  Created by Chu Manh Hai on 2/9/24.
//

import SwiftUI

struct ThreadCell: View {
    let thread: TCThread
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImageView(imageUrl: thread.user?.profileImage)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 8) {
                        Text(thread.user?.fullname ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        Text(thread.createdAt.toAgoFormattedString())
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        Image(systemName: "ellipsis")
                            .foregroundColor(Color(.darkGray))
                    }
                    Text(thread.caption)
                        .font(.footnote)
                    HStack(spacing: 8) {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "heart")
                                
                        })
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "bubble.right")
                                
                        })
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "arrow.rectanglepath")
                                
                        })
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "paperplane")
                        })
                    }
                    .padding(.vertical, 8)
                    .foregroundColor(.black)
                }
                
            }
            .padding()
            Divider()
        }
    }
}

#Preview {
    ThreadCell(thread: PreviewMockData.thread)
}
