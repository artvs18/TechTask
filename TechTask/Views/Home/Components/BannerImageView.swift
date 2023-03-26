//
//  BannerImageView.swift
//  TechTask
//
//  Created by Artemy Volkov on 18.03.2023.
//

import SwiftUI

struct BannerImageView: View {
    let imageURL: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .cornerRadius(10)
                    .clipped()
            } placeholder: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                    
                    ProgressView()
                }
            }
        }
        .frame(width: width, height: height, alignment: .center)
    }
}
