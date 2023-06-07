//
//  Jelly_DataType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_DataType: String, JellyEnum, Codable {
	case temperature
	case wind
	case uvIndex
	case precipChance
	case humidity
	case pressure
	case dewPoint
	case visibility
	case sunriseSunset
	case moonPhase
	case feelsLike
	case hiAndLo
	case cloudCover
	case precipAmount
	case tempAltUnits
	case rainReport
	case codition
	case high
	case low
	case summary
	case sunrise
	case sunset
	case windDirection
	case airQuality
	case pollen

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .temperature:
			return "temperature"
		case .wind:
			return "wind"
		case .uvIndex:
			return "uvIndex"
		case .precipChance:
			return "precipChance"
		case .humidity:
			return "humidity"
		case .pressure:
			return "pressure"
		case .dewPoint:
			return "dewPoint"
		case .visibility:
			return "visibility"
		case .sunriseSunset:
			return "sunriseSunset"
		case .moonPhase:
			return "moonPhase"
		case .feelsLike:
			return "feelsLike"
		case .hiAndLo:
			return "hiAndLo"
		case .cloudCover:
			return "cloudCover"
		case .precipAmount:
			return "precipAmount"
		case .tempAltUnits:
			return "tempAltUnits"
		case .rainReport:
			return "rainReport"
		case .codition:
			return "codition"
		case .high:
			return "high"
		case .low:
			return "low"
		case .summary:
			return "summary"
		case .sunrise:
			return "sunrise"
		case .sunset:
			return "sunset"
		case .windDirection:
			return "windDirection"
		case .airQuality:
			return "airQuality"
		case .pollen:
			return "pollen"

        }
    }
}

extension Jelly_DataType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
