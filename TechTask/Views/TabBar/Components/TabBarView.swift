//
//  TabBarView.swift
//  TechTask
//
//  Created by Artemy Volkov on 20.03.2023.
//

import SwiftUI

struct TabBarView<Content: View>: View {
    @Binding var selection: TabBarItem
    let content: Content
    
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) { 
            ZStack {
                content
                VStack {
                    Spacer()
                    TabBarItemView(selector: $selection, tabs: tabs)
                        .cornerRadius(30, corners: [.topRight, .topLeft])
                }
            }
        }
        .ignoresSafeArea()
        .onPreferenceChange(TabBarPreferenceKey.self) { tabs = $0 }
    }
}
