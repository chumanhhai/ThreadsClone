//
//  EditProfileViewModel.swift
//  ThreadsClone
//
//  Created by henry on 9/9/24.
//

import SwiftUI
import PhotosUI

class EditProfileViewModel: ObservableObject {
    var selectedUIImage: UIImage?
    
    func uploadProfileImage(forUserId userId: String) async throws -> String? {
        guard let selectedUIImage = selectedUIImage else { return nil }
        
        let imageUploader = ImageUploader()
        let userService = UserService()
        let path = "/profile_images/\(NSUUID().uuidString)"
        
        if let imageUrl = try await imageUploader.uploadImage(selectedUIImage, path: path) {
            try await userService.uploadProfileImage(forUserId: userId, imageUrl: imageUrl)
            return imageUrl
        }
        
        return nil
    }
    
}
