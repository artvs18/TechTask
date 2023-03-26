//
//  BannerCategoryView.swift
//  TechTask
//
//  Created by Artemy Volkov on 18.03.2023.
//

import SwiftUI

struct BannerCategoryView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .fontMontserrat(weight: .semibold, size: 6)
            .foregroundColor(.custom.text)
            .padding(3)
            .padding(.horizontal, 5)
            .background(Color.custom.categoryBackground)
            .clipShape(Capsule(style: .continuous))
    }
}
