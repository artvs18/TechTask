//
//  AlternativeAuthButton.swift
//  TechTask
//
//  Created by Artemy Volkov on 16.03.2023.
//

import SwiftUI

struct AlternativeAuthButton: View {
    let icon: Icon
    var action: () -> () = {}
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(icon.rawValue)
                    .frame(width: 24, height: 24)
                
                Text("Sign in with \(icon.rawValue.capitalized)")
                    .fontMontserrat(weight: .medium, size: 12)
            }
            .foregroundColor(.black)
        }
    }
}
