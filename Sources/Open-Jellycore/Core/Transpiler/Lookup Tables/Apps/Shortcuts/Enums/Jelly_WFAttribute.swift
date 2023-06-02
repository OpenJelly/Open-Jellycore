//
//  Jelly_WFAttribute.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFAttribute: String, JellyEnum, Codable {
	case All
	case ProductID
	case Developer
	case Title
	case Language
	case Author
	case RatingIndex
	case Keywords
	case Description
	case Artist
	case Composer
	case Album
	case Song
	case Movie
	case Actor
	case ShortFilm
	case Producer
	case Rating
	case Director
	case ReleaseYear
	case FeatureFilm
	case Show
	case Episode
	case Season
	case Track


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .All:
			return "All"
		case .ProductID:
			return "Product ID"
		case .Developer:
			return "Developer"
		case .Title:
			return "Title"
		case .Language:
			return "Language"
		case .Author:
			return "Author"
		case .RatingIndex:
			return "Rating Index"
		case .Keywords:
			return "Keywords"
		case .Description:
			return "Description"
		case .Artist:
			return "Artist"
		case .Composer:
			return "Composer"
		case .Album:
			return "Album"
		case .Song:
			return "Song"
		case .Movie:
			return "Movie"
		case .Actor:
			return "Actor"
		case .ShortFilm:
			return "Short Film"
		case .Producer:
			return "Producer"
		case .Rating:
			return "Rating"
		case .Director:
			return "Director"
		case .ReleaseYear:
			return "Release Year"
		case .FeatureFilm:
			return "Feature Film"
		case .Show:
			return "Show"
		case .Episode:
			return "Episode"
		case .Season:
			return "Season"
		case .Track:
			return "Track"

        }
    }
}

extension Jelly_WFAttribute {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
