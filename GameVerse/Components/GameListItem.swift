//
//  GameListItem.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 30/08/23.
//

import SwiftUI

struct GameListItem: View {
    var body: some View {
        VStack {VStack {HStack { GeometryReader{ geo in
            Image("imageExample").resizable().cornerRadius(8)
        }.padding(.trailing, 16)
            VStack(alignment: .leading) {
                HStack {
                    Text("Resident Evil 4")
                    Spacer()
                }.padding(.bottom, 6)
                HStack { HStack{
                    Image(systemName: "star.leadinghalf.filled").foregroundColor(SwiftUI.Color("SecondaryColor"))
                    Text("4.5")
                }.padding(.trailing, 28)
                    HStack{
                        Image(systemName: "calendar").foregroundColor(SwiftUI.Color("SecondaryColor"))
                        Text("4.5")
                    }
                }.padding(.bottom, 11)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10){
                        ForEach(0..<6) {_ in
                            Text("Item")
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
        GameListItem()
    }
}
