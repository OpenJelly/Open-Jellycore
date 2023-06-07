//
//  Jelly_Currencies.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_Currencies: String, JellyEnum, Codable {
	case aud
	case brl
	case bgn
	case cad
	case cny
	case hrk
	case czk
	case dkk
	case huf
	case isk
	case inr
	case idr
	case ils
	case jpy
	case myr
	case mxn
	case nzd
	case nok
	case php
	case pln
	case gbp
	case ron
	case rub
	case sgd
	case zar
	case krw
	case sek
	case chf
	case thb
	case `try`
	case usd
	case eur
	case hkd

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .aud:
			return "aud"
		case .brl:
			return "brl"
		case .bgn:
			return "bgn"
		case .cad:
			return "cad"
		case .cny:
			return "cny"
		case .hrk:
			return "hrk"
		case .czk:
			return "czk"
		case .dkk:
			return "dkk"
		case .huf:
			return "huf"
		case .isk:
			return "isk"
		case .inr:
			return "inr"
		case .idr:
			return "idr"
		case .ils:
			return "ils"
		case .jpy:
			return "jpy"
		case .myr:
			return "myr"
		case .mxn:
			return "mxn"
		case .nzd:
			return "nzd"
		case .nok:
			return "nok"
		case .php:
			return "php"
		case .pln:
			return "pln"
		case .gbp:
			return "gbp"
		case .ron:
			return "ron"
		case .rub:
			return "rub"
		case .sgd:
			return "sgd"
		case .zar:
			return "zar"
		case .krw:
			return "krw"
		case .sek:
			return "sek"
		case .chf:
			return "chf"
		case .thb:
			return "thb"
		case .`try`:
			return "try"
		case .usd:
			return "usd"
		case .eur:
			return "eur"
		case .hkd:
			return "hkd"

        }
    }
}

extension Jelly_Currencies {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
