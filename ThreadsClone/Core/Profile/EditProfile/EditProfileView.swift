//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by henry on 9/4/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @State private var bio = "Formula 1 driver fo Scheld Ferrari"
    @State private var link = ""
    @State private var isPrivateProfileOn = false
    @Environment(\.dismiss) var dismiss
    @State var selectedPhotoItem: PhotosPickerItem?
    @Binding var selectedImage: Image?
    @StateObject var viewModel = EditProfileViewModel()
    @EnvironmentObject var userSessionManager: UserSessionManager
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                
                VStack {
                    HStack(spacing: 12) {
                        VStack(alignment: .leading) {
                            Text("Eren Yeager")
                                .fontWeight(.semibold)
                            Text("ancestor_titan")
                                .font(.footnote)
                        }
                        Spacer()
                        PhotosPicker(selection: $selectedPhotoItem) {
                            if let image = selectedImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileImageView()
                            }
                        }
                        .onChange(of: selectedPhotoItem) { newValue in
                            Task { @MainActor in
                                if let item = newValue,
                                   let data = try? await item.loadTransferable(type: Data.self),
                                   let uiImage = UIImage(data: data) {
                                    viewModel.selectedUIImage = uiImage
                                    selectedImage = Image(uiImage: uiImage)
                                }
                            }
                        }
                    }
                    Divider()
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Add bio...", text: $bio, axis: .vertical)
                            .font(.footnote)
                    }
                    Divider()
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Add link...", text: $link, axis: .vertical)
                            .font(.footnote)
                    }
                    Divider()
                    HStack(spacing: 12) {
                        Text("Private profile")
                            .fontWeight(.semibold)
                        Toggle("", isOn: $isPrivateProfileOn)
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
                                guard let id = userSessionManager.user?.id else { return }
                                let imageUrl = try await viewModel.uploadProfileImage(forUserId: id)
                                userSessionManager.user?.profileImage = imageUrl
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
