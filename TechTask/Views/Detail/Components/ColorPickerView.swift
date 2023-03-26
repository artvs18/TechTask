//
//  ColorPickerView.swift
//  TechTask
//
//  Created by Artemy Volkov on 21.03.2023.
//

import SwiftUI

struct ColorPickerView: View {
    @State private var selection = 0
    let hexColors: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Color:")
                .fontMontserrat(weight: .bold, size: 9)
            
            HStack(spacing: 14) {
                ForEach(0..<hexColors.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(hex: hexColors[index]))
                        .onTapGesture { withAnimation { selection = index } }
                        .overlay {
                            if selection == index {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 2)
                            }
                        }
                }
                .frame(width: 32, height: 24)
            }
        }
        .foregroundColor(.custom.profileSecondary)
    }
}
