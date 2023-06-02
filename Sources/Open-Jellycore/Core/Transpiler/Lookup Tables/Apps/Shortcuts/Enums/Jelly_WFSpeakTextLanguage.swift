//
//  Jelly_WFSpeakTextLanguage.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFSpeakTextLanguage: String, JellyEnum, Codable {
	case arSA
	case zhCN
	case zhHK
	case zhTW
	case csCZ
	case daDK
	case nlBE
	case nlNL
	case enAU
	case enIN
	case enIE
	case enZA
	case enGB
	case enUS
	case fiFI
	case frCA
	case frFR
	case deDE
	case elGR
	case heIL
	case hiIN
	case huHU
	case idID
	case itIT
	case jaJP
	case koKR
	case noNO
	case plPL
	case ptBR
	case ptPT
	case roRO
	case skSK
	case esMX
	case esES
	case svSE
	case thTH
	case trTR


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .arSA:
			return "ar-SA"
		case .zhCN:
			return "zh-CN"
		case .zhHK:
			return "zh-HK"
		case .zhTW:
			return "zh-TW"
		case .csCZ:
			return "cs-CZ"
		case .daDK:
			return "da-DK"
		case .nlBE:
			return "nl-BE"
		case .nlNL:
			return "nl-NL"
		case .enAU:
			return "en-AU"
		case .enIN:
			return "en-IN"
		case .enIE:
			return "en-IE"
		case .enZA:
			return "en-ZA"
		case .enGB:
			return "en-GB"
		case .enUS:
			return "en-US"
		case .fiFI:
			return "fi-FI"
		case .frCA:
			return "fr-CA"
		case .frFR:
			return "fr-FR"
		case .deDE:
			return "de-DE"
		case .elGR:
			return "el-GR"
		case .heIL:
			return "he-IL"
		case .hiIN:
			return "hi-IN"
		case .huHU:
			return "hu-HU"
		case .idID:
			return "id-ID"
		case .itIT:
			return "it-IT"
		case .jaJP:
			return "ja-JP"
		case .koKR:
			return "ko-KR"
		case .noNO:
			return "no-NO"
		case .plPL:
			return "pl-PL"
		case .ptBR:
			return "pt-BR"
		case .ptPT:
			return "pt-PT"
		case .roRO:
			return "ro-RO"
		case .skSK:
			return "sk-SK"
		case .esMX:
			return "es-MX"
		case .esES:
			return "es-ES"
		case .svSE:
			return "sv-SE"
		case .thTH:
			return "th-TH"
		case .trTR:
			return "tr-TR"

        }
    }
}

extension Jelly_WFSpeakTextLanguage {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
