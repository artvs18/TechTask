//
//  ProfileButtonView.swift
//  TechTask
//
//  Created by Artemy Volkov on 20.03.2023.
//

import SwiftUI

struct ProfileButtonView: View {
    let title: String
    let icon: Icon
    var balance: String? = nil
    var action: () -> () = {}
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(icon.rawValue)
                    .frame(width: 40, height: 40)
                    .background(Color.custom.iconBackground)
                    .clipShape(Circle())
                               
                Text(title)
                
                Spacer()
                
                if let balance = balance {
                    Text(balance)
                } else if icon != .help && icon != .logOut {
                    Image(Icon.chevronRight.rawValue)
                        .foregroundColor(.black)
                }
            }
            .fontMontserrat(weight: .medium, size: 14)
            .foregroundColor(.custom.text)
        }
    }
}
