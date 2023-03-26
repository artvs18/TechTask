//
//  SearchFieldView.swift
//  TechTask
//
//  Created by Artemy Volkov on 18.03.2023.
//

import SwiftUI

struct SearchFieldView: View {
    enum Field { case search }
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    // MARK: - TexField
                    TextField("", text: $homeViewModel.searchFieldText)
                        .focused($focusedField, equals: .search)
                        .autocorrectionDisabled()
                        .onSubmit { focusedField = nil }
                        .padding()
                    
                    // MARK: - Search Button
                    Button(action: {}) {
                        Image(Icon.magnifier.rawValue)
                            .foregroundColor(.custom.homeSecondary)
                    }
                    .padding(.trailing)
                }
                .multilineTextAlignment(.leading)
                .frame(height: 30)
                .fontMontserrat(weight: .medium, size: 12)
                .foregroundColor(.custom.text)
                .background(Color.custom.search)
                .clipShape(Capsule(style: .continuous))
                
                // MARK: - Placeholder
                if homeViewModel.searchFieldText.isEmpty {
                    Text("What are you looking for ?")
                        .foregroundColor(.custom.homeSecondary)
                        .fontMontserrat(weight: .regular, size: 12)
                        .frame(height: 30)
                        .onTapGesture {
                            withAnimation {
                                focusedField = .search
                            }
                        }
                }
            }
            
            // MARK: - Search List
            if homeViewModel.isSearchShowing {
                List {
                    ForEach(homeViewModel.searchResult, id: \.self) { text in
                        Text(text)
                            .fontMontserrat(weight: .medium, size: 12)
                            .foregroundColor(.custom.text)
                            .onTapGesture {
                                withAnimation {
                                    homeViewModel.searchFieldText = text
                                    homeViewModel.isSearchShowing = false
                                }
                            }
                        
                    }
                    .listRowBackground(Color.custom.search)
                    .listRowSeparatorTint(.custom.homeSecondary)
                }
                .frame(height:
                        homeViewModel.isSearchShowing && focusedField != nil
                       ? CGFloat(42 * homeViewModel.searchResult.count)
                       : 0
                )
                .background(Color.custom.search)
                .listStyle(.plain)
                .scrollIndicators(.never)
                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                .animation(.easeInOut, value: homeViewModel.isSearchShowing)   
            }
        }
    }
}
