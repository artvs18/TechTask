//
//  TechTaskApp.swift
//  TechTask
//
//  Created by Artemy Volkov on 16.03.2023.
//

import SwiftUI

@main
struct TechTaskApp: App {
    @StateObject var signInViewModel = SignInViewModel()
    @StateObject var profileViewModel = ProfileViewModel()
    @StateObject var homeViewModel = HomeViewModel(dataService: NetworkService())
    @StateObject var detailViewModel = DetailViewModel(dataService: NetworkService())
    
    var body: some Scene {
        WindowGroup {
            if signInViewModel.isLoggedIn {
                MainTabBarView()
                    .environmentObject(signInViewModel)
                    .environmentObject(homeViewModel)
                    .environmentObject(detailViewModel)
                    .environmentObject(profileViewModel)
            } else {
                SignInView()
                    .environmentObject(signInViewModel)
            }
        }
    }
}
