//
//  NavBarPhotoView.swift
//  TechTask
//
//  Created by Artemy Volkov on 18.03.2023.
//

import SwiftUI

struct NavBarPhotoView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    private let imageSize: CGFloat = 24
    
    var body: some View {
        VStack(spacing: 0) {
            if let image = profileViewModel.userPhoto {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 1)
                            .foregroundColor(.custom.homeSecondary)
                    }
            } else {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: imageSize, height: imageSize)
                    .foregroundColor(.custom.homeSecondary)
                    .fontWeight(.light)
            }
            
            Button(action: {}) {
                HStack {
                    Text("Location")
                        .foregroundColor(.custom.homeSecondary)
                        .fontMontserrat(weight: .medium, size: 10)
                    Image(Icon.chevronDown.rawValue)
                        .font(.system(size: 8))
                        .bold()
                        .foregroundColor(.custom.text)
                        .offset(x: -5)
                }
            }
        }
    }
}
