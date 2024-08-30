//
//  TCPrimaryButtonModifier.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI

struct TCPrimaryButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44)
            .background(.black)
            .cornerRadius(8)
            .padding(24)
    }
}
