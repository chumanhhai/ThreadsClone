//
//  ThreadCell.swift
//  ThreadsClone
//
//  Created by Chu Manh Hai on 2/9/24.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                Image("img_handsome")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 8) {
                        Text("Eren Yeager")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("10m")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        Image(systemName: "ellipsis")
                            .foregroundColor(Color(.darkGray))
                    }
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")
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
    ThreadCell()
}
