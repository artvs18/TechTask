//
//  SignInView.swift
//  TechTask
//
//  Created by Artemy Volkov on 16.03.2023.
//

import SwiftUI

struct SignInView: View {
    enum Field {
        case firstName
        case lastName
        case email
    }
    
    @EnvironmentObject var signInViewModel: SignInViewModel
    @FocusState private var focusedField: Field?
    
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - Background
                Color.custom.background
                    .ignoresSafeArea()
                    .onTapGesture {
                        focusedField = nil
                    }
                
                VStack(spacing: 35) {
                    Spacer()
                    
                    Text("Sign in")
                        .foregroundColor(.custom.text)
                        .fontMontserrat(weight: .semibold, size: 25)
                    
                    Spacer()
                    
                    // MARK: - TextFields
                    Group {
                        TextFieldView("First name", text: $signInViewModel.firstName, prompt: signInViewModel.firstNamePrompt)
                            .focused($focusedField, equals: .firstName)
                            .textContentType(.givenName)
                            .submitLabel(.next)
                            .onSubmit { focusedField = .lastName }
                        
                        TextFieldView("Last name", text: $signInViewModel.lastName, prompt: signInViewModel.lastNamePrompt)
                            .focused($focusedField, equals: .lastName)
                            .textContentType(.familyName)
                            .submitLabel(.next)
                            .onSubmit { focusedField = .email }
                        
                        TextFieldView("Email", text: $signInViewModel.email, prompt: signInViewModel.emailPrompt)
                            .focused($focusedField, equals: .email)
                            .textContentType(.emailAddress)
                            .submitLabel(.join)
                            .onSubmit {
                                if signInViewModel.canSubmit {
                                    signInViewModel.register()
                                }
                            }
                            
                    }
                    .textFieldStyle(CustomTextFieldStyle())
                    
                    VStack(alignment: .leading) {
                        // MARK: - Sign in button
                        Button(action: { signInViewModel.register() }) {}
                            .buttonStyle(CustomButtonStyle(title: "Sign in"))
                            .disabled(!signInViewModel.canSubmit)
                            .frame(height: 46)
                        
                        // MARK: - NavigationLink to LogInView
                        HStack {
                            Text("Already have an account?")
                                .foregroundColor(.custom.textSecondary)
                            
                            NavigationLink(destination: LoginView()) {
                                Text("Log in")
                                    .foregroundColor(.custom.blue)
                                    .frame(width: 60, height: 30, alignment: .leading)
                            }
                            .environmentObject(signInViewModel)
                            .simultaneousGesture(TapGesture().onEnded {
                                focusedField = nil
                                signInViewModel.clearFields()
                            })
                        }
                        .fontMontserrat(weight: .medium, size: 9)
                    }
                    
                    Spacer()
                    
                    // MARK: - Sign In with Google and Apple
                    VStack(alignment: .leading, spacing: 35) {
                        AlternativeAuthButton(icon: .google)
                        AlternativeAuthButton(icon: .apple)
                    }
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 43)
            }
            .alert(isPresented: $signInViewModel.showAlert) {
                Alert(title: Text(signInViewModel.titleAlert),
                      message: Text(signInViewModel.messageAlert))
            }
            .onAppear { signInViewModel.clearFields() }
        }
    }
}
