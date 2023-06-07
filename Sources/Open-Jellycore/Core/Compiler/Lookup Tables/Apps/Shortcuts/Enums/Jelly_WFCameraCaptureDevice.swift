//
//  Jelly_WFCameraCaptureDevice.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFCameraCaptureDevice: String, JellyEnum, Codable {
	case Front
	case Back

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Front:
			return "Front"
		case .Back:
			return "Back"

        }
    }
}

extension Jelly_WFCameraCaptureDevice {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
