//
//  Jelly_WFSelectedFromLanguage.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFSelectedFromLanguage: String, JellyEnum, Codable {
	case DetectedLanguage
	case Afrikaans
	case Arabic
	case Assamese
	case Bangla
	case Bosnian
	case Bulgarian
	case CantoneseTraditional
	case Catalan
	case ChineseSimplified
	case ChineseTraditional
	case Croatian
	case Czech
	case Danish
	case Dari
	case Dutch
	case English
	case Estonian
	case Fijian
	case Filipino
	case Finnish
	case French
	case FrenchCanada
	case German
	case Greek
	case Gujarati
	case HaitianCreole
	case Hebrew
	case Hindi
	case HmongDaw
	case Hungarian
	case Icelandic
	case Indonesian
	case Irish
	case Italian
	case Japanese
	case Kannada
	case Kazakh
	case KlingonLatin
	case KlingonplqaD
	case Korean
	case KurdishCentral
	case KurdishNorthern
	case Latvian
	case Lithuanian
	case Malagasy
	case Malay
	case Malayalam
	case Maltese
	case Maori
	case Marathi
	case Norwegian
	case Odia
	case Pashto
	case Persian
	case Polish
	case PortugueseBrazil
	case PortuguesePortugal
	case Punjabi
	case QuerétaroOtomi
	case Romanian
	case Russian
	case Samoan
	case SerbianCyrillic
	case SerbianLatin
	case Slovak
	case Slovenian
	case Spanish
	case Swahili
	case Swedish
	case Tahitian
	case Tamil
	case Telugu
	case Thai
	case Tongan
	case Turkish
	case Ukrainian
	case Urdu
	case Vietnamese
	case Welsh
	case YucatecMaya


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .DetectedLanguage:
			return "Detected Language"
		case .Afrikaans:
			return "Afrikaans"
		case .Arabic:
			return "Arabic"
		case .Assamese:
			return "Assamese"
		case .Bangla:
			return "Bangla"
		case .Bosnian:
			return "Bosnian"
		case .Bulgarian:
			return "Bulgarian"
		case .CantoneseTraditional:
			return "Cantonese (Traditional)"
		case .Catalan:
			return "Catalan"
		case .ChineseSimplified:
			return "Chinese Simplified"
		case .ChineseTraditional:
			return "Chinese Traditional"
		case .Croatian:
			return "Croatian"
		case .Czech:
			return "Czech"
		case .Danish:
			return "Danish"
		case .Dari:
			return "Dari"
		case .Dutch:
			return "Dutch"
		case .English:
			return "English"
		case .Estonian:
			return "Estonian"
		case .Fijian:
			return "Fijian"
		case .Filipino:
			return "Filipino"
		case .Finnish:
			return "Finnish"
		case .French:
			return "French"
		case .FrenchCanada:
			return "French (Canada)"
		case .German:
			return "German"
		case .Greek:
			return "Greek"
		case .Gujarati:
			return "Gujarati"
		case .HaitianCreole:
			return "Haitian Creole"
		case .Hebrew:
			return "Hebrew"
		case .Hindi:
			return "Hindi"
		case .HmongDaw:
			return "Hmong Daw"
		case .Hungarian:
			return "Hungarian"
		case .Icelandic:
			return "Icelandic"
		case .Indonesian:
			return "Indonesian"
		case .Irish:
			return "Irish"
		case .Italian:
			return "Italian"
		case .Japanese:
			return "Japanese"
		case .Kannada:
			return "Kannada"
		case .Kazakh:
			return "Kazakh"
		case .KlingonLatin:
			return "Klingon (Latin)"
		case .KlingonplqaD:
			return "Klingon (plqaD)"
		case .Korean:
			return "Korean"
		case .KurdishCentral:
			return "Kurdish (Central)"
		case .KurdishNorthern:
			return "Kurdish (Northern)"
		case .Latvian:
			return "Latvian"
		case .Lithuanian:
			return "Lithuanian"
		case .Malagasy:
			return "Malagasy"
		case .Malay:
			return "Malay"
		case .Malayalam:
			return "Malayalam"
		case .Maltese:
			return "Maltese"
		case .Maori:
			return "Maori"
		case .Marathi:
			return "Marathi"
		case .Norwegian:
			return "Norwegian"
		case .Odia:
			return "Odia"
		case .Pashto:
			return "Pashto"
		case .Persian:
			return "Persian"
		case .Polish:
			return "Polish"
		case .PortugueseBrazil:
			return "Portuguese (Brazil)"
		case .PortuguesePortugal:
			return "Portuguese (Portugal)"
		case .Punjabi:
			return "Punjabi"
		case .QuerétaroOtomi:
			return "Querétaro Otomi"
		case .Romanian:
			return "Romanian"
		case .Russian:
			return "Russian"
		case .Samoan:
			return "Samoan"
		case .SerbianCyrillic:
			return "Serbian (Cyrillic)"
		case .SerbianLatin:
			return "Serbian (Latin)"
		case .Slovak:
			return "Slovak"
		case .Slovenian:
			return "Slovenian"
		case .Spanish:
			return "Spanish"
		case .Swahili:
			return "Swahili"
		case .Swedish:
			return "Swedish"
		case .Tahitian:
			return "Tahitian"
		case .Tamil:
			return "Tamil"
		case .Telugu:
			return "Telugu"
		case .Thai:
			return "Thai"
		case .Tongan:
			return "Tongan"
		case .Turkish:
			return "Turkish"
		case .Ukrainian:
			return "Ukrainian"
		case .Urdu:
			return "Urdu"
		case .Vietnamese:
			return "Vietnamese"
		case .Welsh:
			return "Welsh"
		case .YucatecMaya:
			return "Yucatec Maya"

        }
    }
}

extension Jelly_WFSelectedFromLanguage {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
