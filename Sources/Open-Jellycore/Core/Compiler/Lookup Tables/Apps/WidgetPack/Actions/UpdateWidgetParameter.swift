//
//  UpdateWidgetParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct UpdateWidgetParameter: ParameterProtocol, Codable {
	var view: Jelly_View?
	var name: JellyString?
	var widgetURL: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = UpdateWidgetParameter()

        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "updateWidget", name: "view"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "name" }) {
            parameters.name = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "updateWidget", name: "name"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "widgetURL" }) {
            parameters.widgetURL = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "updateWidget", name: "widgetURL"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"view": "View(identifier: \"View1\", displayString: \"View One\")",
			"name": "\"Main Widget\"",
			"widgetURL": "\"https://jellycuts.com\"",

        ]
    }
}
