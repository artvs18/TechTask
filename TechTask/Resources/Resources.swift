//
//  Resources.swift
//  TechTask
//
//  Created by Artemy Volkov on 16.03.2023.
//

// MARK: - Icons
enum Icon: String {
    case apple        = "apple"
    case backArrow    = "backArrow"
    case card         = "card"
    case cars         = "cars"
    case chevronDown  = "chevronDown"
    case chevronLeft  = "chevronLeft"
    case chevronRight = "chevronRight"
    case divider      = "divider"
    case favourite    = "favourite"
    case furniture    = "furniture"
    case games        = "games"
    case google       = "google"
    case headphones   = "headphones"
    case heart        = "heart"
    case help         = "help"
    case kids         = "kids"
    case like         = "like"
    case logOut       = "logOut"
    case magnifier    = "magnifier"
    case menu         = "menu"
    case phones       = "phones"
    case plus         = "plus"
    case restore      = "restore"
    case share        = "share"
    case smallPlus    = "smallPlus"
    case star         = "star"
    case upload       = "upload"
    case watermark    = "watermark"
}

// MARK: - Tab Bar Items
enum TabBarItem: String, CaseIterable {
    case home = "home"
    case heart = "heart"
    case cart = "cart"
    case chat = "chat"
    case profile = "profile"
}
