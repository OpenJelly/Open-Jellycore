//
//  Jelly_ZoneFormat.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ZoneFormat: String, JellyEnum, Codable {
	case timeZoneShort
	case timeZoneLong
	case differenceToGMT
	case locationZone
	case exemplarCity
	case zoneIDLong
	case zoneIDShort

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .timeZoneShort:
			return "timeZoneShort"
		case .timeZoneLong:
			return "timeZoneLong"
		case .differenceToGMT:
			return "differenceToGMT"
		case .locationZone:
			return "locationZone"
		case .exemplarCity:
			return "exemplarCity"
		case .zoneIDLong:
			return "zoneIDLong"
		case .zoneIDShort:
			return "zoneIDShort"

        }
    }
}

extension Jelly_ZoneFormat {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
