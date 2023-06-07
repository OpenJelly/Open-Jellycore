//
//  Jelly_WFWallpaperLocation.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFWallpaperLocation: String, JellyEnum, Codable {
	case LockScreen
	case HomeScreen

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .LockScreen:
			return "Lock Screen"
		case .HomeScreen:
			return "Home Screen"

        }
    }
}

extension Jelly_WFWallpaperLocation {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
