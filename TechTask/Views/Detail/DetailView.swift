//
//  DetailView.swift
//  TechTask
//
//  Created by Artemy Volkov on 21.03.2023.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var price = 10
    let detail: Detail
    
    var body: some View {
        ZStack {
            Color.custom.background.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                // MARK: - Photo
                PhotosView(imageURLs: detail.imageUrls)
                    .padding(.top, 50)
                    .frame(height: 350)
                    
                Spacer()
                
                VStack(alignment: .leading, spacing: 5) {
                    // MARK: - Header and Price
                    HStack(alignment: .top) {
                        // MARK: - Header
                        Text(detail.name)
                            .fontMontserrat(weight: .semibold, size: 16)
                            .frame(width:150, height: 45, alignment: .topLeading)
                            .lineSpacing(3)
                        Spacer()
                        
                        // MARK: - Price
                        Text(detail.price.description.moneyFormatter())
                            .fontMontserrat(weight: .semibold, size: 14)
                        
                    }
                    .foregroundColor(.custom.text)
                    
                    // MARK: - Description
                    Text(detail.description)
                        .fontMontserrat(weight: .regular, size: 10)
                        .foregroundColor(.custom.profileSecondary)
                        .frame(width: 200, height: 25, alignment: .topLeading)
                    
                    // MARK: - Rating
                    HStack(spacing: 3) {
                        Image(Icon.star.rawValue)
                            .foregroundColor(.custom.yellow)
                          
                        Text(detail.rating.description)
                            .foregroundColor(.custom.text)
                            .fontMontserrat(weight: .semibold, size: 10)
                        
                        Text("(\(detail.numberOfReviews.description) reviews)")
                            .foregroundColor(.custom.profileSecondary)
                            .fontMontserrat(weight: .medium, size: 10)
                    }
                    
                    // MARK: - Color Picker
                    ColorPickerView(hexColors: detail.colors)
                        
                }
                .padding(.horizontal, 25)
                .padding(.top, 40)
                
                Spacer()
                
                // MARK: - Add to card panel
                AddToCartView(price: detail.price)
                    .padding(.vertical)
                
            }
            .toolbar(.hidden, for: .navigationBar)
            .overlay(alignment: .topLeading) {
                Button(action: { dismiss() }) {
                    Image(Icon.chevronLeft.rawValue)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.black)
                }
                .padding(.top, 20)
                .padding(.leading)
                
            }
        }
        .gesture(DragGesture()
            .onEnded { value in
                if value.translation.width > 100 {
                    dismiss()
                }
            }
        )
    }
}
