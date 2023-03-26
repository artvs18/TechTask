//
//  DiscountView.swift
//  TechTask
//
//  Created by Artemy Volkov on 18.03.2023.
//

import SwiftUI

struct DiscountView: View {
    let discount: Int
    
    var body: some View {
        Text("\(discount)% off")
            .fontMontserrat(weight: .bold, size: 10)
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(Color.red)
            .clipShape(Capsule(style: .continuous))
    }
}
