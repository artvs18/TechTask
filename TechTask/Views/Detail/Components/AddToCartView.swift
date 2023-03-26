//
//  AddToCartView.swift
//  TechTask
//
//  Created by Artemy Volkov on 21.03.2023.
//

import SwiftUI

struct AddToCartView: View {
    @State private var productCount = 1
    let price: Int
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Quantity:")
                        .foregroundColor(.custom.profileSecondary)
                        .fontMontserrat(weight: .bold, size: 8)
                    
                    HStack(spacing: 20) {
                        QuantityButtonView(systemName: "minus") {
                            if productCount > 1 {
                                productCount -= 1
                            }
                        }
                        QuantityButtonView(systemName: "plus") {
                            productCount += 1
                        }
                    }
                }
                
                Spacer()
                
                AddToCartButtonView(
                    price: price * productCount,
                    productCount: productCount
                )
            }
            .padding(.horizontal, 24)
            .padding(.top, 19)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 117)
        .background(Color.custom.addToCartBackground)
        .cornerRadius(30, corners: [.topRight, .topLeft])
    }
}
