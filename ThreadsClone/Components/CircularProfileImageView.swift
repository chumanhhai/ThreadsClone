//
//  CircularProfileImageView.swift
//  ThreadsClone
//
//  Created by Chu Manh Hai on 2/9/24.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxSmall, xSmall, small, medium, large, xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall:
            return 28
        case .xSmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 48
        case .large:
            return 64
        case .xLarge:
            return 80
        }
    }
}

struct CircularProfileImageView: View {
    
    let imageUrl: String?
    let size: ProfileImageSize
    
    init(imageUrl: String? = nil, size: ProfileImageSize = .small) {
        self.imageUrl = imageUrl
        self.size = size
    }
    
    var body: some View {
        Group {
            if let imageUrl = imageUrl {
                KFImage(URL(string: imageUrl))
                    .resizable()
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundStyle(Color(.systemGray4))
            }
        }
        .scaledToFill()
        .frame(width: size.dimension, height: size.dimension)
        .clipShape(Circle())
        
            
    }
}

#Preview {
    CircularProfileImageView(imageUrl: nil)
}
