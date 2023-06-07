//
//  Jelly_EditReminderType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_EditReminderType: String, JellyEnum, Codable {
	case Get
	case Delete
	case Open
	case Complete
	case ChangeTitle
	case ChangeAlert
	case ChangeLocation
	case ChangePriority
	case ChangeNote
	case ChangeList
	case RemoveAlert
	case RemoveLocation
	case ChangeDueDate

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Get:
			return "Get"
		case .Delete:
			return "Delete"
		case .Open:
			return "Open"
		case .Complete:
			return "Complete"
		case .ChangeTitle:
			return "ChangeTitle"
		case .ChangeAlert:
			return "ChangeAlert"
		case .ChangeLocation:
			return "ChangeLocation"
		case .ChangePriority:
			return "ChangePriority"
		case .ChangeNote:
			return "ChangeNote"
		case .ChangeList:
			return "ChangeList"
		case .RemoveAlert:
			return "RemoveAlert"
		case .RemoveLocation:
			return "RemoveLocation"
		case .ChangeDueDate:
			return "ChangeDueDate"

        }
    }
}

extension Jelly_EditReminderType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
