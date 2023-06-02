//
//  Jelly_WFEntity.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFEntity: String, JellyEnum, Codable {
	case iPhone
	case iPad
	case Mac
	case Podcasts
	case Authors
	case Songs
	case Artists
	case MusicVideos
	case Albums
	case Episodes
	case Seasons
	case Books
	case Audiobooks


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .iPhone:
			return "iPhone"
		case .iPad:
			return "iPad"
		case .Mac:
			return "Mac"
		case .Podcasts:
			return "Podcasts"
		case .Authors:
			return "Authors"
		case .Songs:
			return "Songs"
		case .Artists:
			return "Artists"
		case .MusicVideos:
			return "Music Videos"
		case .Albums:
			return "Albums"
		case .Episodes:
			return "Episodes"
		case .Seasons:
			return "Seasons"
		case .Books:
			return "Books"
		case .Audiobooks:
			return "Audiobooks"

        }
    }
}

extension Jelly_WFEntity {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
