//
//  Jelly_PendingNotificationMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PendingNotificationMode: String, JellyEnum, Codable {
	case ViewPending
	case RemoveOne
	case RemoveAll
	case RemoveDelivered
	case ViewDelivered
	case RemoveOneDelivered

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .ViewPending:
			return "ViewPending"
		case .RemoveOne:
			return "RemoveOne"
		case .RemoveAll:
			return "RemoveAll"
		case .RemoveDelivered:
			return "RemoveDelivered"
		case .ViewDelivered:
			return "ViewDelivered"
		case .RemoveOneDelivered:
			return "RemoveOneDelivered"

        }
    }
}

extension Jelly_PendingNotificationMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
