//
//  ImageUploader.swift
//  ThreadsClone
//
//  Created by henry on 9/9/24.
//

import Foundation
import UIKit
import FirebaseStorage

struct ImageUploader {
    
    func uploadImage(_ image: UIImage, path: String) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.3) else { return nil }
        let storageReference = Storage.storage().reference(withPath: path)
        _ = try await storageReference.putDataAsync(imageData)
        let url = try await storageReference.downloadURL()
        return url.absoluteString
    }
    
}
