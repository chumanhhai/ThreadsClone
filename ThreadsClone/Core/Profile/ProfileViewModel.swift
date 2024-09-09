//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by henry on 9/9/24.
//

import Foundation
import PhotosUI
import SwiftUI
import Combine

class ProfileViewModel: ObservableObject {
    
//    @Published var selectedPhotoItem: PhotosPickerItem?
//    @Published var selectedProfileImage: Image?
//    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
//        $selectedPhotoItem
//            .receive(on: DispatchQueue.main)
//            .sink { item in
//                Task { @MainActor [weak self] in
//                    if let item = item,
//                       let data = try? await item.loadTransferable(type: Data.self),
//                       let uiImage = UIImage(data: data) {
//                        self?.selectedProfileImage = Image(uiImage: uiImage)
//                    }
//                }
//            }
//            .store(in: &cancellables)
    }
    
}
