//
//  CategoryItemView.swift
//  TechTask
//
//  Created by Artemy Volkov on 18.03.2023.
//

import SwiftUI

struct CategoryItemView: View {
    @State private var isPressed: Bool = false
    let icon: Icon
    
    var body: some View {
        VStack {
            Image(icon.rawValue)
                .foregroundColor(isPressed ? .custom.blue : .custom.text)
                .scaleEffect(isPressed ? 1.1 : 1)
                .frame(width: 40, height: 40)
                .background(Color.custom.iconBackground)
                .clipShape(Circle())
                .onTapGesture { isPressed.toggle() }
                .animation(.easeInOut(duration: 0.25), value: isPressed)
            
            Spacer()
            
            Text(icon.rawValue.capitalized)
                .foregroundColor(.custom.homeSecondaryIcon)
                .fontMontserrat(weight: .medium, size: 8)
        }
    }
}
