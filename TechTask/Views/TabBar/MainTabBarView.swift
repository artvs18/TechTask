//
//  MainTabBarView.swift
//  TechTask
//
//  Created by Artemy Volkov on 20.03.2023.
//

import SwiftUI

struct MainTabBarView: View {
    @State private var selection: TabBarItem = .home
    
    var body: some View {
        TabBarView(selection: $selection) {
            HomeView()
                .tabBarItem(tab: .home, selection: $selection)
            
            Group {
                Text("Favourites View")
                    .tabBarItem(tab: .heart, selection: $selection)
                
                Text("Cart View")
                    .tabBarItem(tab: .cart, selection: $selection)
                
                Text("Chat View")
                    .tabBarItem(tab: .chat, selection: $selection)
            }
            .fontMontserrat(weight: .medium, size: 25)
            
            ProfileView()
                .tabBarItem(tab: .profile, selection: $selection)
        }
    }
}
