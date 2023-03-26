//
//  LoginView.swift
//  TechTask
//
//  Created by Artemy Volkov on 16.03.2023.
//

import SwiftUI

struct LoginView: View {
    enum Field {
        case firstName
        case password
    }
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var signInViewModel: SignInViewModel
    @FocusState private var focusedField: Field?
    
    var body: some View {
        ZStack {
            Color.custom.background
                .ignoresSafeArea()
                .onTapGesture { focusedField = nil }
            
            VStack(spacing: 35) {
                Spacer()
                
                Text("Welcome back")
                    .foregroundColor(.custom.text)
                    .fontMontserrat(weight: .semibold, size: 25)
                
                Spacer()
                
                // MARK: - Textfields
                TextFieldView("First name", text: $signInViewModel.firstName)
                    .focused($focusedField, equals: .firstName)
                    .textContentType(.givenName)
                    .submitLabel(.next)
                    .onSubmit { focusedField = .password }
                
                SecureTextField("Password", text: $signInViewModel.password)
                    .focused($focusedField, equals: .password)
                    .textContentType(.password)
                
                Spacer()
                
                // MARK: - Login Button
                Button(action: { signInViewModel.logIn() }) {}
                    .buttonStyle(CustomButtonStyle(title: "Login"))
                    .frame(height: 46)
                
                Spacer()
            }
            .textFieldStyle(CustomTextFieldStyle())
            .padding(.horizontal, 43)
            .toolbar(.hidden, for: .navigationBar)
        }
        .alert(isPresented: $signInViewModel.showAlert) {
            Alert(title: Text(signInViewModel.titleAlert),
                  message: Text(signInViewModel.messageAlert))
        }
        .overlay(alignment: .topLeading) {
            Button(action: { dismiss() } ) {
                Image(Icon.backArrow.rawValue)
                    .foregroundColor(.black)
                    .frame(width: 30, height: 30)
                    .bold()
            }
            .padding()
        }
        .gesture(DragGesture()
            .onEnded { value in
                if value.translation.width > 100 {
                    dismiss()
                }
            }
        )
    }
}
