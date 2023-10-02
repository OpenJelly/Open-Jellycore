//
//  Jelly_Insight.swift
//  
//
//  Created by Zachary Lineman on 1/4/23.
//

struct Jelly_Insight: JellyObject, Codable {
    @CodableIgnored
    var objectName: String = "Nudget Insight"
    @CodableIgnored
    var correctType: String = "NudgetInsight"
    @CodableIgnored
    var description: String = "An insight about a purchase or income."
    
    var identifier: JellyString?
    var displayString: JellyString?

    init(_ value: CoreNode, scopedVariables: [Variable]) {
//        if let parameter = node as? ObjectNode {
//            if parameter.objectName != correctType {
//                EventReporter.shared.report(error: .typeError(type: objectName, description: "\(parameter.objectName) is not equivalent to the expected type \(objectName)"), textPosition: parameter.textPosition)
//                return
//            }
//
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "identifier" }) {
//                self.identifier = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "identifier", functionName: "NudgetInsight"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "displayString" }) {
//                self.displayString = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "displayString", functionName: "NudgetInsight"), textPosition: node.textPosition)
//            }
//        }
    }
}

