//
//  FavoriteAndShareView.swift
//  TechTask
//
//  Created by Artemy Volkov on 21.03.2023.
//

import SwiftUI

struct FavoriteAndShareView: View {
    var actionLike: () -> () = {}
    var actionFavorite: () -> () = {}
    
    var body: some View {
        VStack {
            Spacer()
            Button(action: actionLike) { Image(Icon.like.rawValue) }
            Spacer()
            Image(Icon.divider.rawValue)
            Spacer()
            Button(action: actionFavorite) { Image(Icon.share.rawValue) }
            Spacer()
        }
        .foregroundColor(.custom.iconTint)
        .frame(width: 42, height: 95)
        .background(Color.custom.iconBackground)
        .cornerRadius(15)
    }
}
