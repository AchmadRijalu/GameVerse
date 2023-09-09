//
//  ContentView.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 22/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            GameListView().toolbarBackground(SwiftUI.Color.red, for: .navigationBar).tabItem {
                Label("Game List", systemImage: "gamecontroller")
            }
            GameFavoritesView().toolbarBackground(SwiftUI.Color.red, for: .navigationBar).tabItem{
                Label("Favorites", systemImage: "heart")
            }
            .toolbar(.visible, for: .tabBar)
        }.tint(SwiftUI.Color("SecondaryColor")).onAppear {
            UITabBar.appearance().backgroundColor = UIColor(SwiftUI.Color("TabBarColor"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
