//
//  Jelly_PassBarcodeFormat.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PassBarcodeFormat: String, JellyEnum, Codable {
	case qr
	case pdffourhundredseventeen
	case aztec
	case codeonehundredtwentyeight

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .qr:
			return "qr"
		case .pdffourhundredseventeen:
			return "pdf417"
		case .aztec:
			return "aztec"
		case .codeonehundredtwentyeight:
			return "code128"

        }
    }
}

extension Jelly_PassBarcodeFormat {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
