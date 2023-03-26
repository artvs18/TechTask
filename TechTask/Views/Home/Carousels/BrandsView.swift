//
//  BrandsView.swift
//  TechTask
//
//  Created by Artemy Volkov on 18.03.2023.
//

import SwiftUI

struct BrandsView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(1...5, id: \.self) { _ in BrandView() }
            }
            .padding(.horizontal)
        }
    }
}
