//
//  Jelly_ListContentsFilter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ListContentsFilter: String, JellyEnum, Codable {
	case All
	case Files
	case Folders

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .All:
			return "All"
		case .Files:
			return "Files"
		case .Folders:
			return "Folders"

        }
    }
}

extension Jelly_ListContentsFilter {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
