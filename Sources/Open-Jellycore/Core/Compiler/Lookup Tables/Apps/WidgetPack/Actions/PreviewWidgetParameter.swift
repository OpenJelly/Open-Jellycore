//
//  PreviewWidgetParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct PreviewWidgetParameter: ParameterProtocol, Codable {
	var view: Jelly_View?
	var size: Jelly_WidgetFamily?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = PreviewWidgetParameter()

        if let value = call.first(where: { node in return node.slotName == "view" }) {
            parameters.view = Jelly_View(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "previewWidget", name: "view"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "size" }) {
            parameters.size = Jelly_WidgetFamily(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "previewWidget", name: "size"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"view": "View(identifier: \"View1\", displayString: \"View One\")",
			"size": "medium",

        ]
    }
}
