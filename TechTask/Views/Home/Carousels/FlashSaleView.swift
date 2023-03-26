//
//  FlashSaleView.swift
//  TechTask
//
//  Created by Artemy Volkov on 18.03.2023.
//

import SwiftUI

struct FlashSaleView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    @EnvironmentObject var detailViewModel: DetailViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 9) {
                ForEach(homeViewModel.flashSale.items) { flashSale in
                    NavigationLink {
                        DetailView(detail: detailViewModel.detail)
                    } label: {
                        FlashSaleItemView(flashSale: flashSale)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
