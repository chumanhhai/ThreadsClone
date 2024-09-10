//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by henry on 9/4/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: EditProfileViewModel
    @ObservedObject var userSessionManager: UserSessionManager
    private var user: TCUser? {
        return userSessionManager.user
    }
    
    init(withUserSessionManager userSessionManager: UserSessionManager) {
        _viewModel = StateObject(wrappedValue: EditProfileViewModel(withUserSessionManager: userSessionManager))
        _userSessionManager = ObservedObject(wrappedValue: userSessionManager)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                
                VStack {
                    HStack(spacing: 12) {
                        VStack(alignment: .leading) {
                            Text(user?.fullname ?? "")
                                .fontWeight(.semibold)
                            Text(user?.username ?? "")
                                .font(.footnote)
                        }
                        Spacer()
                        PhotosPicker(selection: $viewModel.selectedPhotoItem) {
                            if let image = viewModel.selectedImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileImageView(imageUrl: userSessionManager.user?.profileImage)
                            }
                        }
                    }
                    Divider()
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Add bio...", text: $viewModel.bio, axis: .vertical)
                            .font(.footnote)
                    }
                    Divider()
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Add link...", text: $viewModel.link, axis: .vertical)
                            .font(.footnote)
                    }
                    Divider()
                    HStack(spacing: 12) {
                        Text("Private profile")
                            .fontWeight(.semibold)
                        Toggle("", isOn: $viewModel.isPrivateProfileOn)
                    }
                    
                }
                .padding()
                .background(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
            }
            .ignoresSafeArea(edges: [.bottom, .horizontal])
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        Task { @MainActor in
                            do {
                                try await viewModel.updateUserData()
                            } catch {
                                print("DEBUG: \(error.localizedDescription)")
                            }
                            dismiss()
                        }
                    }, label: {
                        Text("Done")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    })
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
