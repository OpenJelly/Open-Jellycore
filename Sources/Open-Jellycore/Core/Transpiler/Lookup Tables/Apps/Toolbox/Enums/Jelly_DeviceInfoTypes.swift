//
//  Jelly_DeviceInfoTypes.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_DeviceInfoTypes: String, JellyEnum, Codable {
	case model
	case ram
	case uptime
	case thermalState
	case availableProcessors
	case activeProcessors
	case operatingSystemVersion
	case hostName
	case diagonalScreenSize
	case ppi
	case screenRatio
	case availableBiometrics

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .model:
			return "model"
		case .ram:
			return "ram"
		case .uptime:
			return "uptime"
		case .thermalState:
			return "thermalState"
		case .availableProcessors:
			return "availableProcessors"
		case .activeProcessors:
			return "activeProcessors"
		case .operatingSystemVersion:
			return "operatingSystemVersion"
		case .hostName:
			return "hostName"
		case .diagonalScreenSize:
			return "diagonalScreenSize"
		case .ppi:
			return "ppi"
		case .screenRatio:
			return "screenRatio"
		case .availableBiometrics:
			return "availableBiometrics"

        }
    }
}

extension Jelly_DeviceInfoTypes {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
