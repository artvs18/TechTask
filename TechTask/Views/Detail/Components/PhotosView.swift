//
//  PhotosView.swift
//  TechTask
//
//  Created by Artemy Volkov on 21.03.2023.
//

import SwiftUI

struct PhotosView: View {
    @State private var selector = 0
    let imageURLs: [String]
    
    var body: some View {
        VStack(spacing: 30) {
            // MARK: - Photos View
            TabView(selection: $selector) {
                ForEach(0..<imageURLs.count, id: \.self) { index in
                    VStack {
                        AsyncImage(url: URL(string: imageURLs[index])) { image in
                            ZStack {
                                image
                                    .resizable()
                                    .scaledToFill()
                            }
                        } placeholder: {
                            ZStack {
                                Color.white
                                ProgressView()
                            }
                        }
                    }
                    .frame(width: 328, height: 279)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                    .offset(x: -35)
                    .tag(index)
                }
            }
            .frame(height: 279)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .overlay { FavoriteAndShareView().offset(x: 125, y: 60) }
            
            // MARK: - PhotoPicker
            HStack(spacing: 16) {
                ForEach(0..<imageURLs.count, id: \.self) { index in
                    SelectImageButtonView(imageURL: imageURLs[index]) {
                        withAnimation { selector = index }
                    }
                    .scaleEffect(selector == index ? 1.25 : 1)
                    .shadow(
                        color: selector == index ? .gray : .clear,
                        radius: selector == index ? 3 : 0, y: 3
                    )
                }
            }
        }
    }
}
