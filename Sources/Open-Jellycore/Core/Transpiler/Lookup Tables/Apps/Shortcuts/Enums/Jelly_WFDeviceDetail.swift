//
//  Jelly_WFDeviceDetail.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFDeviceDetail: String, JellyEnum, Codable {
	case DeviceName
	case DeviceModel
	case SystemVersion
	case ScreenWidth
	case ScreenHeight
	case CurrentVolume
	case CurrentBrightness


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .DeviceName:
			return "Device Name"
		case .DeviceModel:
			return "Device Model"
		case .SystemVersion:
			return "System Version"
		case .ScreenWidth:
			return "Screen Width"
		case .ScreenHeight:
			return "Screen Height"
		case .CurrentVolume:
			return "Current Volume"
		case .CurrentBrightness:
			return "Current Brightness"

        }
    }
}

extension Jelly_WFDeviceDetail {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
