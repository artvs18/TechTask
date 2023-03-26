//
//  LatestItemView.swift
//  TechTask
//
//  Created by Artemy Volkov on 18.03.2023.
//

import SwiftUI

struct LatestItemView: View {
    let latest: Latest.Item
    let width: CGFloat = 114
    let height: CGFloat = 149
    
    var body: some View {
        ZStack {
            BannerImageView(imageURL: latest.imageURL, width: width, height: height)
            
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    BannerCategoryView(title: latest.category)
                    
                    Text(latest.name)
                        .foregroundColor(.white)
                        .fontMontserrat(weight: .bold, size: 9)
                        .shadow(radius: 2)
                        .frame(height: 22, alignment: .topLeading)
                        .multilineTextAlignment(.leading)
                    
                    Text(latest.price.description.moneyFormatter())
                        .foregroundColor(.white)
                        .fontMontserrat(weight: .bold, size: 7)
                        .shadow(radius: 2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .top, .bottom], 5)
                
                VStack {
                    Spacer()
                    BannerButtonView(icon: .smallPlus, iconPadding: 5)
                        .padding([.bottom, .trailing], 5)
                }
            }
        }
        .frame(width: width, height: height)
    }
}
