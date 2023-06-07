//
//  Jelly_HashDataAlgorithm.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_HashDataAlgorithm: String, JellyEnum, Codable {
	case mdtwo
	case mdfour
	case mdfive
	case shaone
	case shatwohundredtwentyfour
	case shatwohundredfiftysix
	case shathreehundredeightyfour
	case shafivehundredtwelve
	case hmacMdfive
	case hmacShaone
	case hmacShatwohundredtwentyfour
	case hmacShatwohundredfiftysix
	case hmacShathreehundredeightyfour
	case hmacShafivehundredtwelve

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .mdtwo:
			return "md2"
		case .mdfour:
			return "md4"
		case .mdfive:
			return "md5"
		case .shaone:
			return "sha1"
		case .shatwohundredtwentyfour:
			return "sha224"
		case .shatwohundredfiftysix:
			return "sha256"
		case .shathreehundredeightyfour:
			return "sha384"
		case .shafivehundredtwelve:
			return "sha512"
		case .hmacMdfive:
			return "hmacMd5"
		case .hmacShaone:
			return "hmacSha1"
		case .hmacShatwohundredtwentyfour:
			return "hmacSha224"
		case .hmacShatwohundredfiftysix:
			return "hmacSha256"
		case .hmacShathreehundredeightyfour:
			return "hmacSha384"
		case .hmacShafivehundredtwelve:
			return "hmacSha512"

        }
    }
}

extension Jelly_HashDataAlgorithm {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
