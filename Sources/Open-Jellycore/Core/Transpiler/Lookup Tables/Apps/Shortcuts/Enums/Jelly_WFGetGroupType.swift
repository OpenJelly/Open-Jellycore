//
//  Jelly_WFGetGroupType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFGetGroupType: String, JellyEnum, Codable {
	case GroupAtIndex
	case AllGroups


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .GroupAtIndex:
			return "Group At Index"
		case .AllGroups:
			return "All Groups"

        }
    }
}

extension Jelly_WFGetGroupType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
