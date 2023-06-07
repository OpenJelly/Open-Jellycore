//
//  GetNumberTrackerValueParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetNumberTrackerValueParameter: ParameterProtocol, Codable {
	var tracker: Jelly_Tracker?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GetNumberTrackerValueParameter()

        if let value = call.first(where: { node in return node.slotName == "tracker" }) {
            parameters.tracker = Jelly_Tracker(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "getNumberTrackerValue", name: "tracker"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"tracker": "Tracker(identifier: \"abcde-f\", displayString: \"Hello World\")",

        ]
    }
}
