//
//  QuantityButtonView.swift
//  TechTask
//
//  Created by Artemy Volkov on 21.03.2023.
//

import SwiftUI

struct QuantityButtonView: View {
    let systemName: String
    var action: () -> () = {}
    
    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .foregroundColor(.white)
                .fontMontserrat(weight: .semibold, size: 9)
                .frame(width: 38, height: 22)
                .background(Color.custom.blue)
                .cornerRadius(8)
        }
    }
}
