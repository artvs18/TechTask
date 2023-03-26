//
//  AddToCartButton.swift
//  TechTask
//
//  Created by Artemy Volkov on 21.03.2023.
//

import SwiftUI

struct AddToCartButtonView: View {
    let price: Int
    let productCount: Int
    var action: () -> () = {}
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(price.description.moneyFormatter())
                Spacer()
                Text("ADD TO CART")
            }
            .padding(.horizontal, 30)
            .foregroundColor(.white)
            .fontMontserrat(weight: .bold, size: 8)
            .frame(width: 170, height: 44)
            .background(Color.custom.blue)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
    }
}
