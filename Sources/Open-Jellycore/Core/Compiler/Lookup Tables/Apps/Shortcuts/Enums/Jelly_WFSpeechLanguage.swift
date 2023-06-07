//
//  Jelly_WFSpeechLanguage.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFSpeechLanguage: String, JellyEnum, Codable {
	case arSA
	case yueCN
	case caES
	case zhCN
	case zhHK
	case zhTW
	case hrHR
	case csCZ
	case daDK
	case nlBE
	case nlNL
	case enAU
	case enCA
	case enIN
	case enID
	case enNZ
	case enPH
	case enSA
	case enSG
	case enZA
	case enAE
	case enGB
	case enUS
	case fiFI
	case frBE
	case frCA
	case frFR
	case frCH
	case deAT
	case deDE
	case deCH
	case elGR
	case heIL
	case hiIN
	case hiINtranslit
	case hiLatn
	case huHU
	case idID
	case itIT
	case itCH
	case jaJP
	case koKR
	case msMY
	case nbNO
	case plPL
	case ptBR
	case ptPT
	case roRO
	case ruRU
	case wuuCN
	case skSK
	case esCL
	case esCO
	case esfourhundrednineteen
	case esMX
	case esES
	case esUS
	case svSE
	case thTH
	case trTR
	case ukUA
	case viVN

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .arSA:
			return "ar-SA"
		case .yueCN:
			return "yue-CN"
		case .caES:
			return "ca-ES"
		case .zhCN:
			return "zh-CN"
		case .zhHK:
			return "zh-HK"
		case .zhTW:
			return "zh-TW"
		case .hrHR:
			return "hr-HR"
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
		case .enCA:
			return "en-CA"
		case .enIN:
			return "en-IN"
		case .enID:
			return "en-ID"
		case .enNZ:
			return "en-NZ"
		case .enPH:
			return "en-PH"
		case .enSA:
			return "en-SA"
		case .enSG:
			return "en-SG"
		case .enZA:
			return "en-ZA"
		case .enAE:
			return "en-AE"
		case .enGB:
			return "en-GB"
		case .enUS:
			return "en-US"
		case .fiFI:
			return "fi-FI"
		case .frBE:
			return "fr-BE"
		case .frCA:
			return "fr-CA"
		case .frFR:
			return "fr-FR"
		case .frCH:
			return "fr-CH"
		case .deAT:
			return "de-AT"
		case .deDE:
			return "de-DE"
		case .deCH:
			return "de-CH"
		case .elGR:
			return "el-GR"
		case .heIL:
			return "he-IL"
		case .hiIN:
			return "hi-IN"
		case .hiINtranslit:
			return "hi-IN-translit"
		case .hiLatn:
			return "hi-Latn"
		case .huHU:
			return "hu-HU"
		case .idID:
			return "id-ID"
		case .itIT:
			return "it-IT"
		case .itCH:
			return "it-CH"
		case .jaJP:
			return " ja-JP"
		case .koKR:
			return "ko-KR"
		case .msMY:
			return "ms-MY"
		case .nbNO:
			return "nb-NO"
		case .plPL:
			return "pl-PL"
		case .ptBR:
			return "pt-BR"
		case .ptPT:
			return "pt-PT"
		case .roRO:
			return "ro-RO"
		case .ruRU:
			return "ru-RU"
		case .wuuCN:
			return "wuu-CN"
		case .skSK:
			return "sk-SK"
		case .esCL:
			return "es-CL"
		case .esCO:
			return "es-CO"
		case .esfourhundrednineteen:
			return "es-419"
		case .esMX:
			return "es-MX"
		case .esES:
			return "es-ES"
		case .esUS:
			return "es-US"
		case .svSE:
			return "sv-SE"
		case .thTH:
			return "th-TH"
		case .trTR:
			return "tr-TR"
		case .ukUA:
			return "uk-UA"
		case .viVN:
			return "vi-VN"

        }
    }
}

extension Jelly_WFSpeechLanguage {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
