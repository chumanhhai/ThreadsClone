//
//  UserProfileHeaderView.swift
//  ThreadsClone
//
//  Created by Chu Manh Hai on 7/9/24.
//

import SwiftUI

struct UserProfileHeaderView: View {
    
    let user: TCUser
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading) {
                    Text(user.fullname)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text(user.username)
                        .font(.subheadline)
                }
                if let bio = user.bio {
                    Text(bio)
                        .font(.subheadline)
                }
                Text("2 followers")
                    .font(.caption)
                    .foregroundStyle(Color(.systemGray))
            }
            Spacer()
            CircularProfileImageView(imageUrl: user.profileImage, size: .large)
        }
    }
}

#Preview {
    UserProfileHeaderView(user: PreviewMockData.user)
}
