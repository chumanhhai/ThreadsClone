//
//  CreateThreadView.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI

struct CreateThreadView: View {
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top, spacing: 12) {
                    CircularProfileImageView()
                    
                    VStack(alignment: .leading) {
                        Text("Eren Yeager")
                            .fontWeight(.semibold)
                        HStack(alignment: .top) {
                            TextField("Start a thread", text: $caption, axis: .vertical)
                            if !caption.isEmpty {
                                Button(action: {
                                    caption = ""
                                }, label: {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.gray)
                                })
                            }
                        }
                    }
                }
                .padding()
                Spacer()
            }
            .navigationTitle("New thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Text("Post")
                            .fontWeight(.semibold)
                            .foregroundStyle(caption.isEmpty ? Color(.systemGray) : .black)
                    })
                    .disabled(caption.isEmpty)
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                            .foregroundStyle(.black)
                    })
                }
            }
        }
    }
}

#Preview {
    CreateThreadView()
}
