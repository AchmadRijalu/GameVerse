//
//  GameDetailView.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 25/08/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameDetailView: View {
    var gameId: Int
    @ObservedObject var gameDetailViewModel: GameDetailViewModel
    var body: some View {
        VStack {
            ScrollView {
                if gameDetailViewModel.isLoading {
                    GeometryReader { geo in
                        VStack {
                            HStack(alignment: .center) {
                                Spacer()
                                ActivityIndicator(.constant(true), style: .large).foregroundColor(.white)
                                    .frame(width: 50, height: 50)
                                    .padding()
                                Spacer()
                            }
                        }
                    }
                }
                else {
                    WebImage(url: URL(string: gameDetailViewModel.gameDetail?.backgroundImage ?? "")).resizable().scaledToFit().cornerRadius(8)
                    VStack {
                        HStack {
                            Text(gameDetailViewModel.gameDetail?.name ?? "\(String(gameId))").font(.system(.title).bold())
                            Spacer()
                        }
                        Divider().frame(maxWidth: .infinity).background(.white)
                        ScrollView(.horizontal) {
                            HStack {
                                VStack {
                                    Text("ESRB Rating").font(.system(.caption)).padding(.bottom, 14)
                                    Text(gameDetailViewModel.gameDetail?.esrbRating.name ?? "").font(.system(.headline).bold())
                                }.padding(8).background(SwiftUI.Color("TabBarColor"))
                                    .cornerRadius(12).padding(.trailing, 24)
                                VStack {
                                    Text("Playtime").font(.system(.caption)).padding(.bottom, 14)
                                    HStack {
                                        Image(systemName: "hourglass").foregroundColor(SwiftUI.Color("SecondaryColor"))
                                        Text("\(gameDetailViewModel.gameDetail?.playtime ?? 0) Hours").font(.system(.headline).bold())
                                    }
                                }.padding(4).background(SwiftUI.Color("TabBarColor"))
                                    .cornerRadius(12).padding(.trailing, 24)
                                VStack {
                                    Text("Rating").font(.system(.caption)).padding(.bottom, 14)
                                    HStack {
                                        Image(systemName: "star.fill").foregroundColor(SwiftUI.Color("SecondaryColor"))
                                        Text("\(String(gameDetailViewModel.gameDetail?.rating ?? 0)) M")
                                            .font(.system(.headline).bold())
                                    }
                                }.padding(4).background(SwiftUI.Color("TabBarColor"))
                                    .cornerRadius(12).padding(.trailing, 24)
                                VStack {
                                    Text("Release").font(.system(.caption)).padding(.bottom, 14)
                                    Text("\(gameDetailViewModel.gameDetail?.released ?? "")")
                                        .font(.system(.headline).bold())
                                }.padding(4).background(SwiftUI.Color("TabBarColor"))
                                    .cornerRadius(12).padding(.trailing, 24)
                            }
                        }.padding(.bottom, 11)
                        Divider().frame(maxWidth: .infinity).background(.white).padding(.bottom, 29)
                        HStack {
                            Text("Description").font(.system(.title2).bold())
                            Spacer()
                        }.padding(.bottom, 12)
                        Text(
                            "\(gameDetailViewModel.gameDetail?.descriptionRaw ?? "")")
                        HStack {
                            Text("Details").font(.system(.title2).bold())
                            Spacer()
                        }.padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
                        VStack {
                            VStack {
                                HStack {
                                    Text("Platform").font(.system(.title3)).bold()
                                    Spacer()
                                }
                                ScrollView(.horizontal) {
                                    HStack {
                                        if let platforms = gameDetailViewModel.gameDetail?.platforms {
                                            ForEach(platforms.indices, id: \.self) { index in
                                                Text(platforms[index].platform.name)
                                                // Add any other platform information you want to display
                                            }
                                        }
                                        
                                    }
                                }
                            }.padding(.bottom, 32)
                            VStack {
                                HStack {
                                    Text("Stores").font(.system(.title3)).bold()
                                    Spacer()
                                }
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(gameDetailViewModel.gameDetail?.stores ?? [], id: \.id) { store in
                                            Text(store.store.name).padding(.trailing, 14)
                                        }
                                    }
                                }
                            }.padding(.bottom, 32)
                            VStack {
                                HStack {
                                    Text("Tags").font(.system(.title3)).bold()
                                    Spacer()
                                }
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(gameDetailViewModel.gameDetail?.tags ?? [], id: \.id) { tag in
                                            Text(tag.name).padding(.trailing, 14)
                                        }
                                        Text("PC").padding(.trailing, 14)
                                        
                                    }
                                }
                            }.padding(.bottom, 12)
                        }.padding(.all, 12).frame(maxWidth: .infinity).background(SwiftUI.Color("TabBarColor"))
                            .cornerRadius(12)
                    }.padding(EdgeInsets(top: 24, leading: 23, bottom: 23, trailing: 24))
                }
                
            }.foregroundColor(.white).background(SwiftUI.Color("BackgroundColor"))
        }.onAppear {
            gameDetailViewModel.getGameDetail(id: gameId)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView(gameId: 0, gameDetailViewModel: GameDetailViewModel())
    }
}
