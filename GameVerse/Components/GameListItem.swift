//
//  GameListItem.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 30/08/23.
//

import SwiftUI
import SDWebImageSwiftUI
struct GameListItem: View {
    var image: String
    var title: String
    var released: String
    var rating: Double
    var genres: [Genre]
    var body: some View {
        VStack {VStack {HStack { GeometryReader { geo in
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
                        ForEach(genres, id: \.id) { genre in
                            Text("\(genre.name)").font(.callout)
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

struct GameListItem_Previews: PreviewProvider {
    static var previews: some View {
        GameListItem(image: "", title: "", released: "", rating: 0, genres: [])
    }
}
