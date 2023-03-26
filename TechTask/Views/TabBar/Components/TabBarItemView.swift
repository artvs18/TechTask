//
//  TabBarItemView.swift
//  TechTask
//
//  Created by Artemy Volkov on 23.03.2023.
//

import SwiftUI

struct TabBarItemView: View {
    @Binding var selector: TabBarItem
    let tabs: [TabBarItem]
    
    var body: some View {
        ZStack {
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    Spacer()
                    tabView(tab: tab).onTapGesture { selector = tab }
                    Spacer()
                }
            }
            .padding(.bottom)
            .padding()
        }
        .background(Color.white.ignoresSafeArea())
    }
}

extension TabBarItemView {
    private func tabView(tab: TabBarItem) -> some View {
        Image(tab.rawValue)
            .foregroundColor(
                selector == tab
                ? .custom.iconTabBarActive
                : .custom.iconTabBarInactive
            )
            .frame(width: 40, height: 40)
            .background(
                Circle()
                    .foregroundColor(
                        selector == tab
                        ? Color.custom.foregroundColorButton
                        : .white
                    )
            )
    }
}

struct TabBarItemViewModifier: ViewModifier {
    @Binding var selection: TabBarItem
    let tab: TabBarItem
    
    func body(content: Content) -> some View {
        content
            .preference(key: TabBarPreferenceKey.self, value: [tab])
            .opacity(selection == tab ? 1 : 0)
    }
}

extension View {
    func tabBarItem(tab: TabBarItem, selection: Binding<TabBarItem>) -> some View {
        modifier(TabBarItemViewModifier(selection: selection, tab: tab))
    }
}
