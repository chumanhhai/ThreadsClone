//
//  CreateThreadView.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI

struct CreateThreadView: View {
    @StateObject var viewModel = CreateThreadViewModel()
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var userSessionManager: UserSessionManager
    var user: TCUser? {
        userSessionManager.user
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top, spacing: 12) {
                    CircularProfileImageView(imageUrl: user?.profileImage)
                    
                    VStack(alignment: .leading) {
                        Text(user?.fullname ?? "")
                            .fontWeight(.semibold)
                        HStack(alignment: .top) {
                            TextField("Start a thread", text: $viewModel.caption, axis: .vertical)
                            if !viewModel.caption.isEmpty {
                                Button(action: {
                                    viewModel.caption = ""
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
                        Task { @MainActor in
                            do {
                                try await viewModel.updateThread(forUserId: userSessionManager.user?.id ?? "")
                            } catch {
                                print("DEBUG: \(error.localizedDescription)")
                            }
                            dismiss()
                        }
                    }, label: {
                        Text("Post")
                            .fontWeight(.semibold)
                            .foregroundStyle(viewModel.caption.isEmpty ? Color(.systemGray) : .black)
                    })
                    .disabled(viewModel.caption.isEmpty)
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
