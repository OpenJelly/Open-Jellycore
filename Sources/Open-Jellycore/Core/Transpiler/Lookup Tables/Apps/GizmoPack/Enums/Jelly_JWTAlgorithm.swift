//
//  Jelly_JWTAlgorithm.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_JWTAlgorithm: String, JellyEnum, Codable {
	case estwohundredfiftysix
	case esthreehundredeightyfour
	case esfivehundredtwelve
	case hstwohundredfiftysix
	case hsthreehundredeightyfour
	case hsfivehundredtwelve
	case pstwohundredfiftysix
	case psthreehundredeightyfour
	case psfivehundredtwelve
	case rstwohundredfiftysix
	case rsthreehundredeightyfour
	case rsfivehundredtwelve
	case none

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .estwohundredfiftysix:
			return "es256"
		case .esthreehundredeightyfour:
			return "es384"
		case .esfivehundredtwelve:
			return "es512"
		case .hstwohundredfiftysix:
			return "hs256"
		case .hsthreehundredeightyfour:
			return "hs384"
		case .hsfivehundredtwelve:
			return "hs512"
		case .pstwohundredfiftysix:
			return "ps256"
		case .psthreehundredeightyfour:
			return "ps384"
		case .psfivehundredtwelve:
			return "ps512"
		case .rstwohundredfiftysix:
			return "rs256"
		case .rsthreehundredeightyfour:
			return "rs384"
		case .rsfivehundredtwelve:
			return "rs512"
		case .none:
			return "none"

        }
    }
}

extension Jelly_JWTAlgorithm {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
