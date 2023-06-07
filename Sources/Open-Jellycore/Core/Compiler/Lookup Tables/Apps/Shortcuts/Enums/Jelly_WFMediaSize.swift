//
//  Jelly_WFMediaSize.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFMediaSize: String, JellyEnum, Codable {
	case sixhundredfortyxfourhundredeighty
	case ninehundredsixtyxfivehundredforty
	case onethousandtwohundredeightyxsevenhundredtwenty
	case onethousandninehundredtwentyxonethousandeighty
	case HEVConethousandninehundredtwentyxonethousandeighty
	case HEVCthreethousandeighthundredfortyxtwothousandonehundredsixty
	case Passthrough

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .sixhundredfortyxfourhundredeighty:
			return "640x480"
		case .ninehundredsixtyxfivehundredforty:
			return "960x540"
		case .onethousandtwohundredeightyxsevenhundredtwenty:
			return "1280x720"
		case .onethousandninehundredtwentyxonethousandeighty:
			return "1920x1080"
		case .HEVConethousandninehundredtwentyxonethousandeighty:
			return "HEVC 1920x1080"
		case .HEVCthreethousandeighthundredfortyxtwothousandonehundredsixty:
			return "HEVC 3840x2160"
		case .Passthrough:
			return "Passthrough"

        }
    }
}

extension Jelly_WFMediaSize {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
