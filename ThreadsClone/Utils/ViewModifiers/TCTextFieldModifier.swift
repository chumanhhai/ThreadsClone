//
//  TCTextFieldModifier.swift
//  ThreadsClone
//
//  Created by henry on 8/30/24.
//

import SwiftUI

struct TCTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
