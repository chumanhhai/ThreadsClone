//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by henry on 9/4/24.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bio = "Formula 1 driver fo Scheld Ferrari"
    @State private var link = ""
    @State private var isPrivateProfileOn = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                
                VStack {
                    HStack(spacing: 12) {
                        VStack(alignment: .leading) {
                            Text("Eren Yeager")
                                .fontWeight(.semibold)
                            Text("ancestor_titan")
                                .font(.footnote)
                        }
                        Spacer()
                        CircularProfileImageView()
                    }
                    Divider()
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Add bio...", text: $bio, axis: .vertical)
                            .font(.footnote)
                    }
                    Divider()
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Add link...", text: $link, axis: .vertical)
                            .font(.footnote)
                    }
                    Divider()
                    HStack(spacing: 12) {
                        Text("Private profile")
                            .fontWeight(.semibold)
                        Toggle("", isOn: $isPrivateProfileOn)
                    }
                    
                }
                .padding()
                .background(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
            }
            .ignoresSafeArea(edges: [.bottom, .horizontal])
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Text("Done")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    })
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        
                    }, label: {
                        Text("Cancel")
                            .foregroundStyle(.black)
                    })
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
