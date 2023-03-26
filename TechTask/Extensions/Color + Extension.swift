//
//  Color + Extension.swift
//  TechTask
//
//  Created by Artemy Volkov on 16.03.2023.
//

import SwiftUI

struct CustomColor {
    let addToCartBackground   = Color("addToCartBackground")
    let background            = Color("background")
    let iconBackground        = Color("iconBackground")
    let blue                  = Color("blue")
    let categoryBackground    = Color("categoryBackground")
    let foregroundColorButton = Color("foregroundColorButton")
    let homeSecondary         = Color("homeSecondary")
    let homeSecondaryIcon     = Color("homeSecondaryIcon")
    let iconTabBarActive      = Color("iconTabBarActive")
    let iconTabBarInactive    = Color("iconTabBarInactive")
    let iconTint              = Color("iconTint")
    let profileSecondary      = Color("profileSecondary")
    let profileUserName       = Color("profileUserName")
    let search                = Color("search")
    let text                  = Color("text")
    let textField             = Color("textField")
    let textSecondary         = Color("textSecondary")
    let yellow                = Color("yellow")
}

extension Color {
    static let custom = CustomColor()
}

extension Color {
    init(hex: String) {
        var hex = hex
        var rgb: UInt64 = 0
        
        if hex.hasPrefix("#") {
            hex.remove(at: hex.startIndex)
        }
        
        Scanner(string: hex).scanHexInt64(&rgb)
        
        self.init(
            red: Double((rgb >> 16) & 0xFF) / 255.0,
            green: Double((rgb >> 8) & 0xFF) / 255.0,
            blue: Double(rgb & 0xFF) / 255.0
        )
    }
}
