//
//  Jelly_WFCellularDetail.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFCellularDetail: String, JellyEnum, Codable {
	case CarrierName
	case RadioTechnology
	case CountryCode

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .CarrierName:
			return "Carrier Name"
		case .RadioTechnology:
			return "Radio Technology"
		case .CountryCode:
			return "Country Code"

        }
    }
}

extension Jelly_WFCellularDetail {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
