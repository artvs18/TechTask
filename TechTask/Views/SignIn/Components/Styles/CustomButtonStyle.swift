//
//  CustomButtonStyle.swift
//  TechTask
//
//  Created by Artemy Volkov on 20.03.2023.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    let title: String
    var image: String? = nil
    
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geometry in
            Text(title)
                .fontMontserrat(weight: .bold, size: 14)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color.custom.blue.opacity(configuration.isPressed ? 0.5 : 1))
                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                .overlay(alignment: .leading) {
                    if let image = image {
                        Image(image)
                            .padding(.leading, geometry.size.width / 4 - 12)
                    }
                }
                .foregroundColor(.custom.foregroundColorButton)
                .scaleEffect(configuration.isPressed ? 1.05 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
                    
        }
    }
}
