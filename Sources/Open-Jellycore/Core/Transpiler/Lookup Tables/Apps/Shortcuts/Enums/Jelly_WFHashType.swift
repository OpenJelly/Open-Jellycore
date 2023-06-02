//
//  Jelly_WFHashType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFHashType: String, JellyEnum, Codable {
	case MDfive
	case SHAone
	case SHAtwohundredfiftysix
	case SHAfivehundredtwelve


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .MDfive:
			return "MD5"
		case .SHAone:
			return "SHA1"
		case .SHAtwohundredfiftysix:
			return "SHA256"
		case .SHAfivehundredtwelve:
			return "SHA512"

        }
    }
}

extension Jelly_WFHashType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
