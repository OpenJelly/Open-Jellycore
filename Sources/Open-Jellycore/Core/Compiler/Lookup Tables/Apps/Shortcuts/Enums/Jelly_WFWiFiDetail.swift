//
//  Jelly_WFWiFiDetail.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFWiFiDetail: String, JellyEnum, Codable {
	case BSSID
	case NetworkName

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .BSSID:
			return "BSSID"
		case .NetworkName:
			return "Network Name"

        }
    }
}

extension Jelly_WFWiFiDetail {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
