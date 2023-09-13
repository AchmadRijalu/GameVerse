//
//  GameFavoriteItem.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 11/09/23.
//

import SwiftUI
import SDWebImageSwiftUI
struct GameFavoriteItem: View {
    var image: String
    var title: String
    var released: String
    var rating: Double
    var genres: [String]
    var body: some View {
        VStack {
            VStack { HStack
                { GeometryReader
                    { geo in
                        WebImage(url: URL(string: image)).resizable().scaledToFit().cornerRadius(8)
                    }.padding(.trailing, 12)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("\(title)")
                            Spacer()
                        }.padding(.bottom, 6)
                        HStack {
                            HStack {
                                Image(systemName: "star.leadinghalf.filled").foregroundColor(SwiftUI.Color("SecondaryColor"))
                                Text("\(String(rating))").font(.caption2).bold()
                            }.padding(.trailing, 12)
                            HStack {
                                Image(systemName: "calendar").foregroundColor(SwiftUI.Color("SecondaryColor"))
                                Text("\(released)").font(.caption2).bold()
                            }
                        }.padding(.bottom, 11)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(genres, id: \.self) { genre in
                                    Text("\(genre)").font(.callout)
                                }
                            }
                        }
                    }.frame(maxWidth: .infinity, maxHeight: .infinity).multilineTextAlignment(.leading)
                }
            }.padding(.bottom, 14)
            Divider().frame(maxWidth: .infinity).background(.white)
        }.foregroundColor(SwiftUI.Color.white).frame(maxWidth: .infinity).foregroundColor(.black).padding(.bottom, 14)
    }
}

struct GameFavoriteItem_Previews: PreviewProvider {
    static var previews: some View {
        GameFavoriteItem(image: "", title: "", released: "", rating: 0, genres: [""])
    }
}
