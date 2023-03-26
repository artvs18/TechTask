//
//  FlashSaleItemView.swift
//  TechTask
//
//  Created by Artemy Volkov on 18.03.2023.
//

import SwiftUI

struct FlashSaleItemView: View {
    let flashSale: FlashSale.Item
    let width: CGFloat = 174
    let height: CGFloat = 221
    
    var body: some View {
        ZStack {
            BannerImageView(imageURL: flashSale.imageURL, width: width, height: height)
            
            HStack {
                VStack(alignment: .leading) {
                    Image(Icon.watermark.rawValue)
                    
                    Spacer()
                    
                    BannerCategoryView(title: flashSale.category)
                        .scaleEffect(1.5)
                        .padding(.leading, 10)
                    
                    Text(flashSale.name)
                        .foregroundColor(.white)
                        .fontMontserrat(weight: .bold, size: 12)
                        .shadow(radius: 2)
                        .frame(height: 30, alignment: .topLeading)
                        .multilineTextAlignment(.leading)
                    
                    Text(flashSale.price.description.moneyFormatter())
                        .foregroundColor(.white)
                        .fontMontserrat(weight: .bold, size: 10)
                        .shadow(radius: 2)
                        .padding(.bottom, 10)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    DiscountView(discount: flashSale.discount)
                        .padding(.trailing, -10)
                    
                    Spacer()
                    
                    HStack {
                        BannerButtonView(icon: .favourite, iconPadding: 9)
                        BannerButtonView(icon: .plus, iconPadding: 12)
                        
                    }
                }
            }
            .padding(6)
        }
        .frame(width: width, height: height)
    }
}
