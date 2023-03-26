//
//  ProfileView.swift
//  TechTask
//
//  Created by Artemy Volkov on 20.03.2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var signInViewModel: SignInViewModel
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @State private var isShowAlert = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: - Background
                Color.custom.background.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        // MARK: - User Photo
                        VStack(spacing: 12) {
                            PhotoView()
                            ChangePhotoButtonView()
                        }
                        
                        // MARK: - User name
                        Text(signInViewModel.currentUser ?? "User Name")
                            .foregroundColor(.custom.profileUserName)
                            .fontMontserrat(weight: .bold, size: 15)
                            .padding([.vertical, .bottom])
                        
                        
                        // MARK: - Upload Button
                        Button(action: {}, label: {})
                            .buttonStyle(CustomButtonStyle(title: "Upload item", image: "upload"))
                            .frame(height: 40)
                            .padding(.horizontal, 42)
                            .padding(.bottom)
                        
                        // MARK: - Buttons
                        VStack(spacing: 20) {
                            ProfileButtonView(title: "Trade store", icon: .card)
                            ProfileButtonView(title: "Payment method", icon: .card)
                            ProfileButtonView(title: "Balance", icon: .card, balance: "$ 1593")
                            ProfileButtonView(title: "Trade history", icon: .card)
                            ProfileButtonView(title: "Restore Purchase", icon: .restore)
                            ProfileButtonView(title: "Help", icon: .help)
                            ProfileButtonView(title: "Log out", icon: .logOut) {
                                isShowAlert.toggle()
                            }
                        }
                        .padding(.horizontal, 32)
                        
                        Spacer()
                    }
                    .padding(.bottom, 50)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {}) {
                                Image(Icon.backArrow.rawValue)
                                    .foregroundColor(.black)
                            }
                        }
                        ToolbarItem(placement: .principal) {
                            Text("Profile")
                                .fontMontserrat(weight: .bold, size: 15)
                                .foregroundColor(.black)
                        }
                    }
                    .alert("Log out?", isPresented: $isShowAlert) {
                        Button("OK") {
                            signInViewModel.logOut()
                            profileViewModel.photoData = nil
                        }
                        Button("Cancel", role: .cancel) {
                            isShowAlert.toggle()
                        }
                    }
                }
            }
        }
    }
}
