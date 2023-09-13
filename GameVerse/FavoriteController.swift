//
//  FavoriteController.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 10/09/23.
//

import Foundation
import CoreData

class FavoriteController: ObservableObject {
    let container = NSPersistentContainer(name: "Favorite")
    init() {
        container.loadPersistentStores {
            descriptoin, error in
            if let error = error {
                print("Failed to load the core data, error : \(error.localizedDescription)")
            }
        }
    }
}
