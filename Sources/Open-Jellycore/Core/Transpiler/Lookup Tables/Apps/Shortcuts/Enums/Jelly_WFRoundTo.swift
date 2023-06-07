//
//  Jelly_WFRoundTo.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFRoundTo: String, JellyEnum, Codable {
	case Millions
	case HundredThousands
	case TenThousands
	case Thousands
	case HundredsPlace
	case TensPlace
	case OnesPlace
	case Tenths
	case Hundredths
	case Thousandths
	case TenThousandths
	case HundredThousandths
	case Millionths
	case TenMillionths
	case HundredMillionths
	case Billionths

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Millions:
			return "Millions"
		case .HundredThousands:
			return "Hundred Thousands"
		case .TenThousands:
			return "Ten Thousands"
		case .Thousands:
			return "Thousands"
		case .HundredsPlace:
			return "Hundreds Place"
		case .TensPlace:
			return "Tens Place"
		case .OnesPlace:
			return "Ones Place"
		case .Tenths:
			return "Tenths"
		case .Hundredths:
			return "Hundredths"
		case .Thousandths:
			return "Thousandths"
		case .TenThousandths:
			return "Ten Thousandths"
		case .HundredThousandths:
			return "Hundred Thousandths"
		case .Millionths:
			return "Millionths"
		case .TenMillionths:
			return "Ten Millionths"
		case .HundredMillionths:
			return "Hundred Millionths"
		case .Billionths:
			return "Billionths"

        }
    }
}

extension Jelly_WFRoundTo {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
