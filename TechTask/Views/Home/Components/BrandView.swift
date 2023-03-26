//
//  BrandView.swift
//  TechTask
//
//  Created by Artemy Volkov on 18.03.2023.
//

import SwiftUI

struct BrandView: View {
    let width: CGFloat = 114
    let height: CGFloat = 149
    
    var body: some View {
        ZStack {
            Color.custom.iconBackground
            
            Image(systemName: "photo")
                .resizable()
                .padding()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.custom.iconTint)
        }
        .frame(width: width, height: height)
        .cornerRadius(15)
    }
}
