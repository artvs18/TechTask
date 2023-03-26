//
//  ProfileViewModel.swift
//  TechTask
//
//  Created by Artemy Volkov on 18.03.2023.
//

import SwiftUI
import PhotosUI

final class ProfileViewModel: ObservableObject {
    @AppStorage("photoData") var photoData: Data?
    @Published var selectedPhoto: PhotosPickerItem? {
        didSet {
            selectPhoto(photo: selectedPhoto)
        }
    }
    
    var userPhoto: Image? {
        if let data = photoData, let image = UIImage(data: data) {
            return Image(uiImage: image)
        }
        return nil
    }
}

extension ProfileViewModel {
    func selectPhoto(photo: PhotosPickerItem?) {
        photo?.loadTransferable(type: Data.self) { result in
            DispatchQueue.main.async { [unowned self] in
                switch result {
                case .success(let data):
                    self.photoData = data
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}
