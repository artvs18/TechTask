//
//  SecureTextFieldView.swift
//  TechTask
//
//  Created by Artemy Volkov on 16.03.2023.
//

import SwiftUI

struct SecureTextField: View {
    @State private var isSecure = true
    
    private var title: String
    private var text: Binding<String>
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self.text = text
    }
    
    var body: some View {
        ZStack {
            if isSecure {
                SecureField(title, text: text)
            } else {
                TextField(title, text: text)
            }
            HStack {
                Spacer()
                
                Button(action: { isSecure.toggle() } ) {
                    Image(systemName: isSecure ? "eye.slash" : "eye")
                        .foregroundColor(.custom.textSecondary)
                        .fontMontserrat(weight: .light, size: 15)
                }
                .padding(.trailing)
            }
        }
        .frame(height: 30)
        .animation(.default, value: isSecure)
    }
}
