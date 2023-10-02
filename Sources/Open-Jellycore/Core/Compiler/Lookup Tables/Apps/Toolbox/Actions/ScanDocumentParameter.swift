//
//  ScanDocumentParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct ScanDocumentParameter: ParameterProtocol, Codable {
	var scanType: Jelly_ScanType?
	var url: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = ScanDocumentParameter()

        if let value = call.first(where: { node in return node.slotName == "scanType" }) {
            parameters.scanType = Jelly_ScanType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "scanDocument", name: "scanType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "url" }) {
            parameters.url = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "scanDocument", name: "url"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"scanType": "text",
			"url": "shortcuts://",

        ]
    }
}
