//
//  GameListView.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 25/08/23.
//

import SwiftUI

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
    var body: some View {VStack { NavigationStack { ScrollView {
        HStack {
            Text("Featured").font(.system(.title2).bold())
            Spacer()
        }.foregroundColor(.white)
        ForEach(gameListViewModel.gameListResult, id: \.id) { game in
            NavigationLink(destination: GameDetailView()) {
                GameListItem(image: game.backgroundImage, title: game.name, released: game.released, rating: game.rating, genres: game.tags)
            }
        }
    }.padding(.all).background(SwiftUI.Color("BackgroundColor"))
            .searchable(text: $searchText)
            .navigationTitle("Game List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) { Image("photo").resizable().aspectRatio(contentMode: .fill).frame(width: 45, height: 45).cornerRadius(50).onTapGesture {
                    self.isShowModal = true
                }
                }
            }.sheet(isPresented: $isShowModal) {
                AboutView()
            }
    }.accentColor(SwiftUI.Color("SecondaryColor")).frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
    }
}
