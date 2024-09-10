//
//  UserCell.swift
//  ThreadsClone
//
//  Created by Chu Manh Hai on 2/9/24.
//

import SwiftUI

struct UserCell: View {
    
    let user: TCUser
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            CircularProfileImageView(imageUrl: user.profileImage)
            VStack(alignment: .leading, spacing: 4) {
                Text(user.fullname)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text(user.bio ?? "")
                    .font(.footnote)
            }
            Spacer()
            Button(action: {
                
            }, label: {
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .frame(width: 100, height: 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4), lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    }
            })
        }
    }
}

#Preview {
    UserCell(user: PreviewMockData.user)
}
