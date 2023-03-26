//
//  HomeView.swift
//  TechTask
//
//  Created by Artemy Volkov on 18.03.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.custom.background.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        // MARK: - Search View
                        SearchFieldView()
                            .padding(.horizontal, 50)
                            .padding(.top, 10)
                            .frame(height: 30, alignment: .top)
                            .zIndex(1)
                           
                        VStack {
                            // MARK: - Category View
                            CategoryView()
                            
                            if homeViewModel.isAllDataLoaded {
                                // MARK: - Latest Carousel
                                HeaderView(title: "Latest")
                                    .padding(.horizontal)
                                    .padding(.top)
                                LatestView()
                                
                                // MARK: - Flash Sale
                                HeaderView(title: "Flash Sale")
                                    .padding(.horizontal)
                                    .padding(.top)
                                FlashSaleView()
                                
                                // MARK: - Brands
                                HeaderView(title: "Brands")
                                    .padding(.horizontal)
                                    .padding(.top)
                                BrandsView()
                            } else {
                                ProgressView().padding(.top, 250)
                            }
                        }
                        .padding(.top)
                    }
                    .padding(.bottom, 70)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {}) {
                                Image(Icon.menu.rawValue)
                                    .foregroundColor(.black)
                                    .padding([.vertical, .trailing])
                            }
                        }
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Text("Trade by")
                                    .foregroundColor(.custom.text)
                                Text("bata")
                                    .foregroundColor(.custom.blue)
                            }
                            .fontMontserrat(weight: .bold, size: 20)
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavBarPhotoView()
                        }
                    }
                }
                .refreshable { homeViewModel.loadData() }
            }
        }
    }
}
