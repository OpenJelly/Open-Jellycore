//
//  NudgetTag.swift
//  
//
//  Created by Zachary Lineman on 1/4/23.
//

struct Jelly_NudgetTag: JellyObject, Codable {
    @CodableIgnored
    var objectName: String = "Nudget Tag"
    @CodableIgnored
    var correctType: String = "NudgetTag"
    @CodableIgnored
    var description: String = "A tag for an expense."
    
    var identifier: JellyString?
    var displayString: JellyString?

    init(_ value: CoreNode, scopedVariables: [Variable]) {
//        if let parameter = node as? ObjectNode {
//            if parameter.objectName != correctType {
//                ErrorReporter.shared.report(error: .typeError(type: objectName, description: "\(parameter.objectName) is not equivalent to the expected type \(objectName)"), textPosition: parameter.textPosition)
//                return
//            }
//
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "identifier" }) {
//                self.identifier = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "identifier", functionName: "NudgetTag"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "displayString" }) {
//                self.displayString = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "displayString", functionName: "NudgetTag"), textPosition: node.textPosition)
//            }
//        }
    }
}

