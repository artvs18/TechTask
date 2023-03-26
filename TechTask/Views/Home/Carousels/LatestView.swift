//
//  LatestView.swift
//  TechTask
//
//  Created by Artemy Volkov on 18.03.2023.
//

import SwiftUI

struct LatestView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(homeViewModel.latest.items) { LatestItemView(latest: $0) }
            }
            .padding(.horizontal)
        }
    }
}
