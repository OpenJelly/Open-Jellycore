//
//  Jelly_WFMediaType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFMediaType: String, JellyEnum, Codable {
	case Movies
	case Music
	case MusicVideos
	case Audiobooks
	case ShortFilms
	case TVShows
	case Books
	case All


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .Movies:
			return "Movies"
		case .Music:
			return "Music"
		case .MusicVideos:
			return "Music Videos"
		case .Audiobooks:
			return "Audiobooks"
		case .ShortFilms:
			return "Short Films"
		case .TVShows:
			return "TV Shows"
		case .Books:
			return "Books"
		case .All:
			return "All"

        }
    }
}

extension Jelly_WFMediaType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
