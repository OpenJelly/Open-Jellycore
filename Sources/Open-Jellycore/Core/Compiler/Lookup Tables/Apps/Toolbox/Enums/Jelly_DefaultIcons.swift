//
//  Jelly_DefaultIcons.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_DefaultIcons: String, JellyEnum, Codable {
	case alert
	case cancel
	case confirm
	case movie
	case music
	case menu
	case back
	case delete
	case share
	case new
	case folder
	case file
	case search
	case person
	case love
	case more
	case photo

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .alert:
			return "alert"
		case .cancel:
			return "cancel"
		case .confirm:
			return "confirm"
		case .movie:
			return "movie"
		case .music:
			return "music"
		case .menu:
			return "menu"
		case .back:
			return "back"
		case .delete:
			return "delete"
		case .share:
			return "share"
		case .new:
			return "new"
		case .folder:
			return "folder"
		case .file:
			return "file"
		case .search:
			return "search"
		case .person:
			return "person"
		case .love:
			return "love"
		case .more:
			return "more"
		case .photo:
			return "photo"

        }
    }
}

extension Jelly_DefaultIcons {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
