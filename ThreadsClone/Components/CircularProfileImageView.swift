//
//  CircularProfileImageView.swift
//  ThreadsClone
//
//  Created by Chu Manh Hai on 2/9/24.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("img_handsome")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CircularProfileImageView()
}
