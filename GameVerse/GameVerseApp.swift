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
    @StateObject private var favoriteController = FavoriteController()
    var body: some Scene {
        WindowGroup {
//            ContentView()
            SplashScreenView().environment(\.managedObjectContext, favoriteController.container.viewContext).environmentObject(aboutusViewModel)
        }
    }
}
