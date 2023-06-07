//
//  Jelly_EditEventType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_EditEventType: String, JellyEnum, Codable {
	case Title
	case StartDate
	case EndDate
	case Notes
	case Location
	case URL
	case Availability
	case Calendar
	case Delete
	case RemoveEnd
	case RemoveLocation
	case RemoveURL

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Title:
			return "Title"
		case .StartDate:
			return "StartDate"
		case .EndDate:
			return "EndDate"
		case .Notes:
			return "Notes"
		case .Location:
			return "Location"
		case .URL:
			return "URL"
		case .Availability:
			return "Availability"
		case .Calendar:
			return "Calendar"
		case .Delete:
			return "Delete"
		case .RemoveEnd:
			return "RemoveEnd"
		case .RemoveLocation:
			return "RemoveLocation"
		case .RemoveURL:
			return "RemoveURL"

        }
    }
}

extension Jelly_EditEventType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
