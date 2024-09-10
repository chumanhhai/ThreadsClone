//
//  EditProfileViewModel.swift
//  ThreadsClone
//
//  Created by henry on 9/9/24.
//

import SwiftUI
import PhotosUI
import Combine

class EditProfileViewModel: ObservableObject {
    @Published var bio = ""
    @Published var link = ""
    @Published var isPrivateProfileOn = false
    @Published var selectedPhotoItem: PhotosPickerItem?
    @Published var selectedImage: Image?
    private var selectedUIImage: UIImage?
    private let userSessionManager: UserSessionManager
    private var cancellables = Set<AnyCancellable>()
    
    init(withUserSessionManager userSessionManager: UserSessionManager) {
        self.userSessionManager = userSessionManager
        if let user = userSessionManager.user {
            bio = user.bio ?? ""
            link = user.link ?? ""
            isPrivateProfileOn = user.isPrivacyProfileOn
        }
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        $selectedPhotoItem.sink { [weak self] item in
            Task { @MainActor [weak self] in
                if let item = item,
                   let data = try? await item.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    self?.selectedUIImage = uiImage
                    self?.selectedImage = Image(uiImage: uiImage)
                }
            }
        }
        .store(in: &cancellables)
    }
    
    @MainActor
    func updateUserData() async throws {
        guard var user = userSessionManager.user else { return }
        
        if let selectedUIImage = selectedUIImage {
            let imageUploader = ImageUploader()
            let path = "/profile_images/\(NSUUID().uuidString)"
            user.profileImage = try await imageUploader.uploadImage(selectedUIImage, path: path)
        }
        user.bio = bio
        user.link = link
        user.isPrivacyProfileOn = isPrivateProfileOn
        let userService = UserService()
        try await userService.updateUserData(user)
        userSessionManager.user = user
    }
    
}
