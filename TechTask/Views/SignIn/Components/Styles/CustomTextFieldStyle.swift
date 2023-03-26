//
//  CustomTextFieldStyle.swift
//  TechTask
//
//  Created by Artemy Volkov on 17.03.2023.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .multilineTextAlignment(.center)
            .autocorrectionDisabled()
            .padding()
            .frame(height: 30)
            .fontMontserrat(weight: .medium, size: 12)
            .foregroundColor(.custom.text)
            .background(Color.custom.textField)
            .clipShape(Capsule(style: .continuous))
    }
}
