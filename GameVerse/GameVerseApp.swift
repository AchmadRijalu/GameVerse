//
//  GameVerseApp.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 22/08/23.
//

import SwiftUI

@main
struct GameVerseApp: App {
    @StateObject var aboutusViewModel: AboutViewModel = AboutViewModel()
    var body: some Scene {
        WindowGroup {
//            ContentView()
            SplashScreenView().environmentObject(aboutusViewModel)
        }
    }
}
