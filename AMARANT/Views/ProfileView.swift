//
//  ProfileView.swift
//  AMARANT
//
//  Created by Александр Х on 07.08.2024.
//

import Foundation


import SwiftUI

struct ProfileView: View {
    @State private var searchText = ""
    @State private var showProfile = false
    @State private var showCatalog = false
    @State private var showFavorites = false
    @State private var showStores = false
    @State private var showCart = false

    
    let products: [Product] = [
        Product(name: "Product 1", image: "thyreogen"),
        Product(name: "Product 2", image: "thyreogen"),
        Product(name: "Product 3", image: "thyreogen")
    ]
    
    var body: some View {
        ZStack(alignment: .bottom){
            BackgroundView(topColor: .orange, middleColor: .purple, bottomColor: .white)
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    headerContainer
                        .background(Color.productPink)
                        .cornerRadius(32)
                        .frame(height: 280)
                        .padding(.horizontal)
                        .padding(.leading, -28)
                        .padding(.trailing, -28)
                        .padding(.top, -20)
                    
                    stuckButton
                        .background(Color.primaryPink.opacity(0.4))
                    
                    
                    
                    ProductScroll
                        .padding(.top, -22)
                        .padding(.bottom, 50)
                }
                .padding()
            }
            footerView

        }
        .navigationBarHidden(true)


    }
    
    var footerView: some View{
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
            .clipShape(Capsule())
            .padding(.horizontal, 2)
        }

    }
    
    var headerContainer: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack{
                TextField("Искать", text: $searchText)
                    .padding(10)
                    .padding(.leading, 18)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .overlay {
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.secondary)
                                .padding(.leading, 4)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
            }
            .padding()
            Text("Фамилия Имя")
                .font(.title)
                .foregroundColor(.white) // Change the text color to contrast with the background
                .padding(.horizontal)
            
            // Buttons in a horizontal stack
            HStack(alignment: .center ) {
                Button(action: {
                    // Action for Button 1
                }) {
                    VStack(alignment: .leading){
                        Image(systemName: "heart.fill")
                            .foregroundColor(.yellow)
                        Spacer()
                        Text("Избранное")
                            .font(.body)
                        Spacer()
                        Text("40")
                            .font(.body)
                            .foregroundStyle( .gray)
                            .opacity(0.5)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white)
                    .foregroundColor(.productPink)
                    .cornerRadius(10)
                }
                
                Button(action: {
                    // Action for Button 2
                }) {
                    VStack(alignment: .leading){
                        Image(systemName: "cart.fill")
                            .foregroundColor(.yellow)
                        Spacer()
                        Text("Покупки")
                            .font(.body)
                            .foregroundColor(.productPink)
                        Spacer()
                        Text("Заказать снова")
                            .font(.body)
                            .foregroundStyle( .gray)
                            .opacity(0.5)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(10)
                }
            }
            .padding(.vertical)
            .padding(.horizontal)
        }
    }
    var stuckButton: some View {
        VStack(alignment: .center) {
            Button(action: {
                // Действие для кнопки "Настройки"
            }) {
                HStack {
                    Text("Настройки")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.forward")
                        .foregroundStyle(.white)
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.productPink)
                .cornerRadius(16) // Применяем здесь
            }
            Button(action: {
                // Действие для кнопки "Язык"
            }) {
                HStack {
                    Text("Язык")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.forward")
                        .foregroundStyle(.white)
                    
                    
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.productPink)
                .cornerRadius(16) // Применяем здесь
            }
            Button(action: {
                // Действие для кнопки "О приложении"
            }) {
                HStack {
                    Text("О приложении")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.forward")
                        .foregroundStyle(.white)
                    
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.productPink)
                .cornerRadius(16) // Применяем здесь
            }
            
            Button(action: {
                // Действие для кнопки "Помощь"
            }) {
                HStack {
                    Text("Помощь")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.forward")
                        .foregroundStyle(.white)
                    
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.productPink)
                .cornerRadius(16) // Применяем здесь
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top, -10)
        .padding(.horizontal, -10)
    }
    
    struct Product: Identifiable {
        let id = UUID()
        let name: String
        let image: String
    }
    
    
    var ProductScroll: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(products) { product in
                    VStack {
                        Image(product.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 130, height: 130)
                            .cornerRadius(10)
                        Text(product.name)
                            .font(.headline)
                            .padding(.vertical, 20)
                            .padding(.horizontal, 44)
                            .foregroundStyle(.white)
                            .background(Color.productPink)
                            .cornerRadius(0)
                        
                    }
                    .padding(0.1)
                    .background(Color.white)
                    .cornerRadius(32)
                    .shadow(radius: 3)
                }
            }
            .padding(.horizontal, 1)
            .padding(.vertical, 14)
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
}

