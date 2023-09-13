//
//  GameListView.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 25/08/23.
//

import SwiftUI
import Alamofire
import SDWebImageSwiftUI

struct GameListView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .black
    }
    @State var isShowModal: Bool = false
    @State var searchText = ""
    private  var sharedMethod: SharedMethods = SharedMethods()
    @ObservedObject var gameListViewModel = GameListviewModel()
    @ObservedObject var gameDetailViewModel: GameDetailViewModel = GameDetailViewModel()
    var searchResult: [Result] {
        if searchText.isEmpty {
            return gameListViewModel.gameListResult
        } else {
            return gameListViewModel.gameListResult.filter {
                $0.name.contains(searchText)
            }
        }
    }
    var body: some View {VStack { NavigationStack { ScrollView {
        HStack {
            Text("Featured").font(.system(.title2).bold())
            Spacer()
        }.foregroundColor(.white)
        if gameListViewModel.isLoading {
            ActivityIndicator(.constant(true), style: .large).foregroundColor(.white)
                .frame(width: 50, height: 50)
                .padding()
        } else {
            if gameListViewModel.gameListResult.isEmpty {
                Text("No data available.")
            } else {
                ForEach(searchResult, id: \.id) { game in
                    NavigationLink(destination:
                        GameDetailView(gameId: game.id, gameTitle: game.name,
                        gameRating: game.rating, gameReleased: game.released,
                                       gameGenres : game.tags, gameBackground: game.backgroundImage,
                        gameDetailViewModel: gameDetailViewModel)) {
                        GameListItem(image: game.backgroundImage,
                                     title: game.name, released: game.released,
                                     rating: game.rating, genres: game.tags)
                    }
                }
            }
        }
    }.padding(.all).background(SwiftUI.Color("BackgroundColor"))
            .toolbar { ToolbarItem(placement: .navigationBarTrailing) { Image("photo").resizable().aspectRatio(contentMode: .fill).frame(width: 45, height: 45).cornerRadius(50).onTapGesture {
                self.isShowModal = true
            }
            }
            }.sheet(isPresented: $isShowModal) {
                AboutView()
            }
            .searchable(text: $searchText)
            .navigationTitle("Game List")
            .preferredColorScheme(.dark)
    }.accentColor(SwiftUI.Color("SecondaryColor")).frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}
