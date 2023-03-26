//
//  BannerButtonView.swift
//  TechTask
//
//  Created by Artemy Volkov on 24.03.2023.
//

import SwiftUI

struct BannerButtonView: View {
    let icon: Icon
    let iconPadding: Double
    
    var body: some View {
        Button(action: {}) {
            Image(icon.rawValue)
                .foregroundColor(.custom.iconTint)
                .padding(iconPadding)
                .background(Color.custom.iconBackground)
                .clipShape(Circle())
        }
    }
}
