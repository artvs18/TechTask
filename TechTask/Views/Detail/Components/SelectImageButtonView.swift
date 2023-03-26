//
//  SelectImageButtonView.swift
//  TechTask
//
//  Created by Artemy Volkov on 21.03.2023.
//

import SwiftUI

struct SelectImageButtonView: View {
    let imageURL: String
    var action: () -> () = {}
    
    var body: some View {
        Button(action: action) {
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ZStack {
                    Rectangle().foregroundColor(.white)
                    ProgressView()
                }
            }
        }
        .frame(width: 65, height: 37)
        .cornerRadius(10)
        .clipped()
    }
}
