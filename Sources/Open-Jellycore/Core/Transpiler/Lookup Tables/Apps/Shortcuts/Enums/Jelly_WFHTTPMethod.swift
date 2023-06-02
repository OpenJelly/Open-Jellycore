//
//  Jelly_WFHTTPMethod.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFHTTPMethod: String, JellyEnum, Codable {
	case GET
	case POST
	case PUT
	case PATCH
	case DELETE


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .GET:
			return "GET"
		case .POST:
			return "POST"
		case .PUT:
			return "PUT"
		case .PATCH:
			return "PATCH"
		case .DELETE:
			return "DELETE"

        }
    }
}

extension Jelly_WFHTTPMethod {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
