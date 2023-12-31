// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gameDetailModel = try? JSONDecoder().decode(GameDetailModel.self, from: jsonData)

import Foundation

// MARK: - GameDetailModel
struct GameDetailModel: Codable, Identifiable {
    var id: Int
    var slug, name, nameOriginal, description: String
    var metacritic: Int
    var metacriticPlatforms: [MetacriticPlatform]
    var released: String
    var tba: Bool
    var updated: String
    var backgroundImage, backgroundImageAdditional: String
    var website: String
    var rating: Double
    var ratingTop: Int
    var ratings: [Rating]
    var reactions: [String: Int]
    var added: Int
    var addedByStatus: AddedByStatus
    var playtime, screenshotsCount, moviesCount, creatorsCount: Int
    var achievementsCount, parentAchievementsCount: Int
    var redditURL: String
    var redditName, redditDescription, redditLogo: String
    var redditCount, twitchCount, youtubeCount, reviewsTextCount: Int
    var ratingsCount, suggestionsCount: Int
    var alternativeNames: [String]
    var metacriticURL: String
    var parentsCount, additionsCount, gameSeriesCount: Int
    var userGame: JSONNull?
    var reviewsCount: Int
    var saturatedColor, dominantColor: String
    var parentPlatforms: [ParentPlatform]
    var platforms: [PlatformElementDetail]
    var stores: [StoreDetail]
    var developers, genres, tags, publishers: [Developer]
    var esrbRating: EsrbRating
    var clip: JSONNull?
    var descriptionRaw: String
    enum CodingKeys: String, CodingKey {
        case id, slug, name
        case nameOriginal = "name_original"
        case description, metacritic
        case metacriticPlatforms = "metacritic_platforms"
        case released, tba, updated
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
        case website, rating
        case ratingTop = "rating_top"
        case ratings, reactions, added
        case addedByStatus = "added_by_status"
        case playtime
        case screenshotsCount = "screenshots_count"
        case moviesCount = "movies_count"
        case creatorsCount = "creators_count"
        case achievementsCount = "achievements_count"
        case parentAchievementsCount = "parent_achievements_count"
        case redditURL = "reddit_url"
        case redditName = "reddit_name"
        case redditDescription = "reddit_description"
        case redditLogo = "reddit_logo"
        case redditCount = "reddit_count"
        case twitchCount = "twitch_count"
        case youtubeCount = "youtube_count"
        case reviewsTextCount = "reviews_text_count"
        case ratingsCount = "ratings_count"
        case suggestionsCount = "suggestions_count"
        case alternativeNames = "alternative_names"
        case metacriticURL = "metacritic_url"
        case parentsCount = "parents_count"
        case additionsCount = "additions_count"
        case gameSeriesCount = "game_series_count"
        case userGame = "user_game"
        case reviewsCount = "reviews_count"
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case parentPlatforms = "parent_platforms"
        case platforms, stores, developers, genres, tags, publishers
        case esrbRating = "esrb_rating"
        case clip
        case descriptionRaw = "description_raw"
    }
}
// MARK: - Developer
struct Developer: Codable {
    var id: Int
    var name, slug: String
    var gamesCount: Int
    var imageBackground: String
    var domain: String?
    var language: Language?
    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case domain, language
    }
}

// MARK: - MetacriticPlatform
struct MetacriticPlatform: Codable {
    var metascore: Int
    var url: String
    var platform: MetacriticPlatformPlatform
}

// MARK: - MetacriticPlatformPlatform
struct MetacriticPlatformPlatform: Codable {
    var platform: Int
    var name, slug: String
}

struct StoreDetail: Codable {
    var id: Int
    var url: String
    var store: Developer
}

struct PlatformElementDetail: Codable {
    var platform: PlatformPlatformDetail
    var releasedAt: String
    var requirements: RequirementsDetail
    enum CodingKeys: String, CodingKey {
        case platform
        case releasedAt = "released_at"
        case requirements
    }
}
struct PlatformPlatformDetail: Codable {
    var id: Int
    var name, slug: String
    var image, yearEnd: JSONNull?
    var yearStart: Int?
    var gamesCount: Int
    var imageBackground: String

    enum CodingKeys: String, CodingKey {
        case id, name, slug, image
        case yearEnd = "year_end"
        case yearStart = "year_start"
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
}

struct RequirementsDetail: Codable {
    var minimum, recommended: String?
}
