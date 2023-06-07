//
//  Jelly_TMDBGenres.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_TMDBGenres: String, JellyEnum, Codable {
	case Action
	case Adventure
	case Animation
	case Comedy
	case Crime
	case Documentary
	case Drama
	case Family
	case Fantasy
	case History
	case Horror
	case Music
	case Mystery
	case Romance
	case SciFi
	case TVMovie
	case Thriller
	case War
	case Western

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Action:
			return "Action"
		case .Adventure:
			return "Adventure"
		case .Animation:
			return "Animation"
		case .Comedy:
			return "Comedy"
		case .Crime:
			return "Crime"
		case .Documentary:
			return "Documentary"
		case .Drama:
			return "Drama"
		case .Family:
			return "Family"
		case .Fantasy:
			return "Fantasy"
		case .History:
			return "History"
		case .Horror:
			return "Horror"
		case .Music:
			return "Music"
		case .Mystery:
			return "Mystery"
		case .Romance:
			return "Romance"
		case .SciFi:
			return "SciFi"
		case .TVMovie:
			return "TVMovie"
		case .Thriller:
			return "Thriller"
		case .War:
			return "War"
		case .Western:
			return "Western"

        }
    }
}

extension Jelly_TMDBGenres {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
