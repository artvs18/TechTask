//
//  Font + Extension.swift
//  TechTask
//
//  Created by Artemy Volkov on 16.03.2023.
//

import SwiftUI

struct FontMontserrat: ViewModifier {
    enum Weight: String {
        case black    = "Montserrat-Black"
        case bold     = "Montserrat-Bold"
        case italic   = "Montserrat-Italic"
        case light    = "Montserrat-Light"
        case medium   = "Montserrat-Medium"
        case regular  = "Montserrat-Regular"
        case semibold = "Montserrat-SemiBold"
    }
    
    let weight: Weight
    let size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom(weight.rawValue, size: size))
    }
}

extension View {
    func fontMontserrat(weight: FontMontserrat.Weight = .regular, size: CGFloat) -> some View {
        modifier(FontMontserrat(weight: weight, size: size))
    }
}
