//
//  GlobalVariablesParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GlobalVariablesParameter: ParameterProtocol, Codable {
	var mode: Jelly_GlobalVariableMode?
	var getVariableListFilter: Jelly_VariableFilters?
	var deleteVariableListFilter: Jelly_VariableFilters?
	var addVariableFilterList: Jelly_VariableFilters?
	var setVariableKey: JellyString?
	var setVariableValue: JellyString?
	var getVariableKey: JellyString?
	var deleteVariableKey: JellyString?
	var getAllMode: Jelly_GetAllVariablesMode?
	var joinMode: Jelly_JoinMode?
	var newLine: JellyBoolean?
	var addKey: JellyString?
	var addValue: JellyString?
	var includeCreationDate: JellyBoolean?
	var addDictValue: JellyString?
	var addDictKey: JellyString?
	var getDictVarKey: JellyString?
	var getDictValue: JellyString?
	var addDictValueKey: JellyString?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = GlobalVariablesParameter()

        if let value = call.first(where: { node in return node.slotName == "mode" }) {
            parameters.mode = Jelly_GlobalVariableMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "globalVariables", name: "mode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "getVariableListFilter" }) {
            parameters.getVariableListFilter = Jelly_VariableFilters(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "globalVariables", name: "getVariableListFilter"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "deleteVariableListFilter" }) {
            parameters.deleteVariableListFilter = Jelly_VariableFilters(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "globalVariables", name: "deleteVariableListFilter"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addVariableFilterList" }) {
            parameters.addVariableFilterList = Jelly_VariableFilters(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "globalVariables", name: "addVariableFilterList"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "setVariableKey" }) {
            parameters.setVariableKey = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "globalVariables", name: "setVariableKey"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "setVariableValue" }) {
            parameters.setVariableValue = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "globalVariables", name: "setVariableValue"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "getVariableKey" }) {
            parameters.getVariableKey = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "globalVariables", name: "getVariableKey"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "deleteVariableKey" }) {
            parameters.deleteVariableKey = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "globalVariables", name: "deleteVariableKey"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "getAllMode" }) {
            parameters.getAllMode = Jelly_GetAllVariablesMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "globalVariables", name: "getAllMode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "joinMode" }) {
            parameters.joinMode = Jelly_JoinMode(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "globalVariables", name: "joinMode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "newLine" }) {
            parameters.newLine = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "globalVariables", name: "newLine"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addKey" }) {
            parameters.addKey = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "globalVariables", name: "addKey"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addValue" }) {
            parameters.addValue = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "globalVariables", name: "addValue"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "includeCreationDate" }) {
            parameters.includeCreationDate = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "globalVariables", name: "includeCreationDate"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addDictValue" }) {
            parameters.addDictValue = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "globalVariables", name: "addDictValue"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addDictKey" }) {
            parameters.addDictKey = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "globalVariables", name: "addDictKey"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "getDictVarKey" }) {
            parameters.getDictVarKey = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "globalVariables", name: "getDictVarKey"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "getDictValue" }) {
            parameters.getDictValue = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "globalVariables", name: "getDictValue"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "addDictValueKey" }) {
            parameters.addDictValueKey = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "globalVariables", name: "addDictValueKey"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"mode": "Set",
			"getVariableListFilter": "All",
			"deleteVariableListFilter": "All",
			"addVariableFilterList": "All",
			"setVariableKey": "Username",
			"setVariableValue": "ShortcutInput",
			"getVariableKey": "",
			"deleteVariableKey": "",
			"getAllMode": "",
			"joinMode": "",
			"newLine": "",
			"addKey": "",
			"addValue": "",
			"includeCreationDate": "",
			"addDictValue": "",
			"addDictKey": "",
			"getDictVarKey": "",
			"getDictValue": "",
			"addDictValueKey": "",

        ]
    }
}
