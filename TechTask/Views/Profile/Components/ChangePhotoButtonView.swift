//
//  ChangePhotoButtonView.swift
//  TechTask
//
//  Created by Artemy Volkov on 20.03.2023.
//

import SwiftUI
import PhotosUI

struct ChangePhotoButtonView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        PhotosPicker(selection: $profileViewModel.selectedPhoto, matching: .images, photoLibrary: .shared()) {
            Text("Change photo")
                .fontMontserrat(weight: .medium, size: 10)
                .foregroundColor(.custom.profileSecondary)
        }
    }
}
