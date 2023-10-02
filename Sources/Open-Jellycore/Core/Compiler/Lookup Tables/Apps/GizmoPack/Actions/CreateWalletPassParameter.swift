//
//  CreateWalletPassParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct CreateWalletPassParameter: ParameterProtocol, Codable {
	var title: JellyString?
	var descript: JellyString?
	var barcode: Jelly_PassBarcodeFormat?
	var barcodeData: JellyString?
	var barcodeLabel: JellyString?
	var type: Jelly_PassType?
	var transitType: Jelly_PassTransitType?
	var from: JellyString?
	var to: JellyString?
	var genericPrimary: JellyString?
	var couponPrimary: JellyString?
	var eventTicketPrimary: JellyString?
	var storeCardPrimary: JellyString?
	var boardingPassFooter: JellyVariableReference?
	var couponStrip: JellyVariableReference?
	var genericThumbnail: JellyVariableReference?
	var storeCardStrip: JellyVariableReference?
	var eventTicketStrip: JellyVariableReference?
	var eventTicketBackground: JellyVariableReference?
	var eventTicketThumbnail: JellyVariableReference?
	var header: JellyArray<JellyVariableReference>?
	var secondary: JellyArray<JellyVariableReference>?
	var auxiliary: JellyArray<JellyVariableReference>?
	var back: JellyArray<JellyVariableReference>?
	var backgroundColor: JellyString?
	var foregroundColor: JellyString?
	var labelColor: JellyString?
	var icon: JellyVariableReference?
	var logo: JellyVariableReference?
	var location: ShortcutsPlacemark?
	var distance: ShortcutsQuantity?
	var date: JellyDate?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = CreateWalletPassParameter()

        if let value = call.first(where: { node in return node.slotName == "title" }) {
            parameters.title = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "title"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "descript" }) {
            parameters.descript = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "descript"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "barcode" }) {
            parameters.barcode = Jelly_PassBarcodeFormat(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "barcode"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "barcodeData" }) {
            parameters.barcodeData = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "barcodeData"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "barcodeLabel" }) {
            parameters.barcodeLabel = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "barcodeLabel"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "type" }) {
            parameters.type = Jelly_PassType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "type"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "transitType" }) {
            parameters.transitType = Jelly_PassTransitType(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "transitType"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "from" }) {
            parameters.from = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "from"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "to" }) {
            parameters.to = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "to"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "genericPrimary" }) {
            parameters.genericPrimary = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "genericPrimary"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "couponPrimary" }) {
            parameters.couponPrimary = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "couponPrimary"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "eventTicketPrimary" }) {
            parameters.eventTicketPrimary = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "eventTicketPrimary"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "storeCardPrimary" }) {
            parameters.storeCardPrimary = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "storeCardPrimary"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "boardingPassFooter" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.boardingPassFooter = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "boardingPassFooter"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "couponStrip" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.couponStrip = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "couponStrip"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "genericThumbnail" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.genericThumbnail = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "genericThumbnail"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "storeCardStrip" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.storeCardStrip = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "storeCardStrip"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "eventTicketStrip" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.eventTicketStrip = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "eventTicketStrip"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "eventTicketBackground" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.eventTicketBackground = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "eventTicketBackground"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "eventTicketThumbnail" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.eventTicketThumbnail = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "eventTicketThumbnail"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "header" }) {
            parameters.header = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "header"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "secondary" }) {
            parameters.secondary = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "secondary"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "auxiliary" }) {
            parameters.auxiliary = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "auxiliary"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "back" }) {
            parameters.back = JellyArray<JellyVariableReference>(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "back"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "backgroundColor" }) {
            parameters.backgroundColor = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "backgroundColor"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "foregroundColor" }) {
            parameters.foregroundColor = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "foregroundColor"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "labelColor" }) {
            parameters.labelColor = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "labelColor"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "icon" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.icon = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "icon"), node: nil)
        }
        if let variableCall = call.first(where: { node in return node.slotName == "logo" }) {
            if let variable = Scope.find(variableCall.content, in: scopedVariables) {
                parameters.logo = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                EventReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "logo"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "location" }) {
            parameters.location = ShortcutsPlacemark(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "location"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "distance" }) {
            parameters.distance = ShortcutsQuantity(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "distance"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "date" }) {
            parameters.date = JellyDate(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            EventReporter.shared.reportError(error: .missingParameter(function: "createWalletPass", name: "date"), node: nil)
        }

        return parameters
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
			"title": "\"Jellycuts Release Party\"",
			"descript": "\"A wallet pass to get into the Jellycuts release party\"",
			"barcode": "barcode",
			"barcodeData": "\"https://jellycuts.com/releaseParty\"",
			"barcodeLabel": "\"Release Website\"",
			"type": "eventTicket",
			"transitType": "",
			"from": "\"Zachary Lineman\"",
			"to": "\"You!\"",
			"genericPrimary": "\"\"",
			"couponPrimary": "\"\"",
			"eventTicketPrimary": "\"\"",
			"storeCardPrimary": "\"\"",
			"boardingPassFooter": "",
			"couponStrip": "",
			"genericThumbnail": "",
			"storeCardStrip": "",
			"eventTicketStrip": "",
			"eventTicketBackground": "",
			"eventTicketThumbnail": "",
			"header": "",
			"secondary": "",
			"auxiliary": "",
			"back": "",
			"backgroundColor": "\"#161f27\"",
			"foregroundColor": "\"#ffffff\"",
			"labelColor": "",
			"icon": "",
			"logo": "",
			"location": "",
			"distance": "",
			"date": "",

        ]
    }
}
