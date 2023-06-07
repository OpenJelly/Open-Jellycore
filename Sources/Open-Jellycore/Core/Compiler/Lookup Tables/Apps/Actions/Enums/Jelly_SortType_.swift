//
//  Jelly_SortType_.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_SortType_: String, JellyEnum, Codable {
	case natural
	case localized
	case localizedCaseInsensitive

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .natural:
			return "natural"
		case .localized:
			return "localized"
		case .localizedCaseInsensitive:
			return "localizedCaseInsensitive"

        }
    }
}

extension Jelly_SortType_ {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
