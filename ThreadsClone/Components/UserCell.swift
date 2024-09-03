//
//  UserCell.swift
//  ThreadsClone
//
//  Created by Chu Manh Hai on 2/9/24.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            CircularProfileImageView()
            VStack(alignment: .leading, spacing: 4) {
                Text("Eren Yeager")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("Lorem Ipsum is simply")
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
    UserCell()
}
