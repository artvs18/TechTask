//
//  TextFieldView.swift
//  TechTask
//
//  Created by Artemy Volkov on 17.03.2023.
//

import SwiftUI

struct TextFieldView: View {
    private var title: String
    private var text: Binding<String>
    private var prompt: String?
    
    init(_ title: String, text: Binding<String>, prompt: String? = nil) {
        self.title = title
        self.text = text
        self.prompt = prompt
    }
    
    var body: some View {
        ZStack {
            TextField(title, text: text)
            
            if let prompt = prompt {
                Text(prompt)
                    .foregroundColor(.red)
                    .fontMontserrat(weight: .regular, size: 11)
                    .padding(.horizontal)
                    .offset(y: 25)
            }
        }
    }
}
