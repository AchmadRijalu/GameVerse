//
//  GameDetailView.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 25/08/23.
//

import SwiftUI

struct GameDetailView: View {
    //    @Binding var title: String
    //    @Binding var esrbRating: String
    //    @Binding var rating: Int
    //    @Binding var playTime: Int
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Image("imageExample2").resizable().aspectRatio(contentMode: .fit)
                }
                VStack {
                    HStack {
                        Text("Grand Theft Auto V").font(.system(.title).bold())
                        Spacer()
                    }
                    Divider().frame(maxWidth: .infinity).background(.white)
                    ScrollView(.horizontal) {
                        HStack {
                            VStack {
                                Text("ESRB Rating").font(.system(.caption)).padding(.bottom, 14)
                                Text("Mature").font(.system(.headline).bold())
                            }.padding(8).background(SwiftUI.Color("TabBarColor")).cornerRadius(12).padding(.trailing, 24)
                            VStack {
                                Text("Playtime").font(.system(.caption)).padding(.bottom, 14)
                                HStack {
                                    Image(systemName: "hourglass").foregroundColor(SwiftUI.Color("SecondaryColor"))
                                    Text("42 Hours").font(.system(.headline).bold())
                                }
                            }.padding(4).background(SwiftUI.Color("TabBarColor")).cornerRadius(12).padding(.trailing, 24)
                            VStack {
                                Text("Rating").font(.system(.caption)).padding(.bottom, 14)
                                HStack {
                                    Image(systemName: "star.fill").foregroundColor(SwiftUI.Color("SecondaryColor"))
                                    Text("3.7 M").font(.system(.headline).bold())
                                }
                            }.padding(4).background(SwiftUI.Color("TabBarColor")).cornerRadius(12).padding(.trailing, 24)
                            VStack {
                                Text("Release").font(.system(.caption)).padding(.bottom, 14)
                                Text("2013-09-1").font(.system(.headline).bold())
                            }.padding(4).background(SwiftUI.Color("TabBarColor")).cornerRadius(12).padding(.trailing, 24)
                        }
                    }.padding(.bottom, 11)
                    Divider().frame(maxWidth: .infinity).background(.white).padding(.bottom, 29)
                    HStack {
                        Text("Description").font(.system(.title2).bold())
                        Spacer()
                    }.padding(.bottom, 12)
                    Text("Rockstar Games went bigger, since their previous installment of the series. You get the complicated and realistic world-building from Liberty ")
                    HStack {
                        Text("Details").font(.system(.title2).bold())
                        Spacer()
                    }.padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
                    VStack {
                        Text("LAGU")
                    }.frame(maxWidth: .infinity, maxHeight: 120).background(SwiftUI.Color("TabBarColor"))
                }.padding(EdgeInsets(top: 24, leading: 23, bottom: 23, trailing: 24))
            }.foregroundColor(.white).background(SwiftUI.Color("BackgroundColor"))
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView()
    }
}
