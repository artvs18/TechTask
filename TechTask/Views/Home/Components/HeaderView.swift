//
//  HeaderView.swift
//  TechTask
//
//  Created by Artemy Volkov on 18.03.2023.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    var action: () -> () = {}
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(title)
                .foregroundColor(.custom.text)
                .fontMontserrat(weight: .semibold, size: 14)
            
            Spacer()
            
            Button(action: action) {
                Text("View all")
                    .foregroundColor(.custom.iconTabBarInactive)
                    .fontMontserrat(weight: .semibold, size: 9)
            }
        }
    }
}
