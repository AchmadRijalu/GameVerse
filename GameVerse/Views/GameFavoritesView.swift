//
//  GameFavoritesView.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 07/09/23.
//

import SwiftUI
import CoreData

struct GameFavoritesView: View {
    @State var searchText: String = ""
    @FetchRequest(sortDescriptors: []) var favorites: FetchedResults <FavoriteCoreData>
    //    var favoriteList: [String] = [""]
    @ObservedObject var gameDetailViewModel: GameDetailViewModel = GameDetailViewModel()
    var body: some View {
        NavigationStack {
            if favorites.count == 0 {
                VStack {
                    Spacer()
                    HStack {
                        Text("Your Favorite are Empty :(")
                    }
                    Spacer()
                }
                .searchable(text: $searchText)
                .navigationTitle("Favorites")
            } else {
                ScrollView {
                    ForEach(favorites, id: \.id) { fav in
                        NavigationLink(destination:
                                        GameDetailView(gameId: Int(fav.gameId), gameTitle: fav.title ?? "",
                                        gameRating: fav.rating, gameReleased: fav.released ?? "",
                                        gameBackground: fav.backgroundImage ?? "",
                                        gameDetailViewModel: gameDetailViewModel)) {
                            GameFavoriteItem(image: fav.backgroundImage ?? "", title: fav.title ?? "",
                                        released: fav.released ?? "",
                                        rating: fav.rating, genres: fav.genres ?? [""]
                                         )
                        }
                    }
                }
                .searchable(text: $searchText)
                .navigationTitle("Favorites")
            }
        }
    }
}
struct GameFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        GameFavoritesView()
    }
}
