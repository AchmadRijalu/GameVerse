//
//  FavoriteData+CoreDataProperties.swift
//  GameVerse
//
//  Created by Achmad Rijalu on 10/09/23.
//
//

import Foundation
import CoreData

extension FavoriteData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteData> {
        return NSFetchRequest<FavoriteData>(entityName: "FavoriteData")
    }

    @NSManaged public var backgroundImage: String?
    @NSManaged public var genres: [String]?
    @NSManaged public var rating: Double
    @NSManaged public var released: String?
    @NSManaged public var title: String?

}

extension FavoriteData : Identifiable {

}
