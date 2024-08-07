//
//  HomeView.swift
//  AMARANT
//
//  Created by Александр Х on 07.08.2024.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var showProfile = false
    @State private var showCatalog = false
    @State private var showFavorites = false
    @State private var showStores = false
    @State private var showCart = false
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView(topColor: .orange, middleColor: .purple, bottomColor: .white)
                ZStack {
                    ScrollView {
                        BannerView()
                        SearchAndCatalogView()
                        TitleTextView(titleText: "Популярные товары")
                        PopularProductView()
                        CategoryCard()
                            .padding()
                    }
                    .padding(.bottom, 50)
                    GeometryReader { geometry in
                        VStack {
                            Spacer()
                            HStack {
                                ButtonNavigBarView(image: Image(systemName: "person.crop.circle.fill"), action: {
                                    showProfile.toggle()
                                }, text: "Профиль")
                                .background(
                                    NavigationLink("", destination: ProfileView(), isActive: $showProfile)
                                        .hidden()
                                )
                                .padding(.leading)
                                Spacer()
                                ButtonNavigBarView(image: Image(systemName: "fork.knife"), action: {
                                    showCatalog.toggle()
                                }, text: "Каталог")
                                .background(
                                    NavigationLink("", destination: HomeView(), isActive: $showCatalog)
                                        .hidden()
                                )
                                Spacer()
                                ButtonNavigBarView(image: Image(systemName: "heart.fill"), action: {
                                    showFavorites.toggle()
                                }, text: "Избранное")
                                .background(
                                    NavigationLink("", destination: Text("Favorites Page"), isActive: $showFavorites)
                                        .hidden()
                                )
                                Spacer()
                                ButtonNavigBarView(image: Image(systemName: "house.fill"), action: {
                                    showStores.toggle()
                                }, text: "Магазины")
                                .background(
                                    NavigationLink("", destination: Text("Stores Page"), isActive: $showStores)
                                        .hidden()
                                )
                                Spacer()
                                ButtonNavigBarView(image: Image(systemName: "cart.fill"), action: {
                                    showCart.toggle()
                                }, text: "Корзина")
                                .background(
                                    NavigationLink("", destination: Text("Cart Page"), isActive: $showCart)
                                        .hidden()
                                )

                                .padding(.trailing)
                            }
                            .padding()
                            .background(Color.productPink)
//                            .frame(width: geometry.size.width*0.98, height: geometry.size.height*0.1)
                            .clipShape(Capsule())
                            .padding(.horizontal, 5)
                        }
                        .navigationBarHidden(true) 
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct BackgroundView: View {
    var topColor: Color
    var middleColor: Color
    var bottomColor: Color
    @State private var animateGradient: Bool = false
    
    var body: some View {
        Rectangle()
            .fill(LinearGradient(colors: [ topColor, middleColor, bottomColor],
                                 startPoint: .topLeading,
                                 endPoint: .bottomTrailing))
            .ignoresSafeArea()
            .hueRotation(.degrees(animateGradient ? 45 : 0))
            .onAppear {
                withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
            }
    }
}

struct SearchAndCatalogView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        HStack{
            HStack{
                // Поле для поиска товаров
                Image(systemName: "magnifyingglass")
                TextField("Найти продукты", text: $viewModel.searchText)
            }
            .padding(.all, 20)
            .background(.white)
            .clipShape(.capsule)
            .padding(.leading, 12)
            
            // Кнопка для выбора категории товаров
            Button(action: {
                // Действие для выбора категории
            }) {
                Text("Категории")
                    .frame(width: 120, height: 62)
                    .foregroundColor(.white)
                    .background(Color(.productPink))
                    .cornerRadius(8)
                    .padding(.trailing, 8)
            }
        }
        .padding(.vertical, 10)
    }
}

struct ButtonNavigBarView: View {
    let image: Image
    let action: () -> Void
    let text: String
    
    var body: some View {
            VStack {
                Button(action: action) {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(.white)
                        .background(Color.productPink)
                    
                }
                Text(text)
                    .foregroundStyle(.white)
                    .font(.caption2)
                    .lineLimit(1)
                    .fontDesign(.rounded)
                    .minimumScaleFactor(0.5)
            }
    }
}

struct TitleTextView: View {
    let titleText: String
    var body: some View {
        ZStack {
            HStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 190, height: 30)
                    .foregroundStyle(.productPink)
                    .shadow(radius: 3)
                    .padding(.leading, 12)
                Spacer()
            }
            HStack {
                Text(titleText)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.leading, 21)
                    .shadow(radius: 3)
                Spacer()
            }
        }
    }
}
