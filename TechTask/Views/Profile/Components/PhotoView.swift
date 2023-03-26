//
//  PhotoView.swift
//  TechTask
//
//  Created by Artemy Volkov on 20.03.2023.
//

import SwiftUI

struct PhotoView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    private let sizeImage: CGFloat = 60
    
    var body: some View {
        if let image = profileViewModel.userPhoto {
            image
                .resizable()
                .scaledToFill()
                .frame(width: sizeImage, height: sizeImage)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(lineWidth: 1)
                        .foregroundColor(.custom.profileSecondary)
                }
        } else {
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFill()
                .fontWeight(.thin)
                .frame(width: sizeImage, height: sizeImage)
                .foregroundColor(.custom.profileSecondary)
        }
    }
}
