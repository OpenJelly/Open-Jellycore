//
//  Jelly_BMSortBy.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_BMSortBy: String, JellyEnum, Codable {
	case name
	case size
	case folderDepth
	case dateCreated
	case dateModified
	case kind
	case tagCount

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .name:
			return "name"
		case .size:
			return "size"
		case .folderDepth:
			return "folderDepth"
		case .dateCreated:
			return "dateCreated"
		case .dateModified:
			return "dateModified"
		case .kind:
			return "kind"
		case .tagCount:
			return "tagCount"

        }
    }
}

extension Jelly_BMSortBy {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
