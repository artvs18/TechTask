//
//  CategoryView.swift
//  TechTask
//
//  Created by Artemy Volkov on 18.03.2023.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 18) {
                ForEach(homeViewModel.categoryIcons, id: \.self) {
                    CategoryItemView(icon: $0)
                }
            }
            .padding(.horizontal)
        }
    }
}
