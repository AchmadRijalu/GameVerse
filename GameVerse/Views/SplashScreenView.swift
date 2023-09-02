//
//  SplashScreenView.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 02/09/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State var isActive: Bool = false
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack {
                    Image("gameverse-nobg").resizable().scaledToFill().frame(width: 128, height: 128)
                }.scaleEffect(size).opacity(opacity)
                    .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation(.easeIn(duration: 1.3)) {
                            self.size = 0.9
                            self.opacity = 1.00
                        }
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity).background(SwiftUI.Color("BackgroundColor")).onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.3) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
