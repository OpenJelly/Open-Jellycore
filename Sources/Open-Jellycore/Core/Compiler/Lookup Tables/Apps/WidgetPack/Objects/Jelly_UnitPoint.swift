//
//  Jelly_UnitPoint.swift
//  
//
//  Created by Zachary Lineman on 1/5/23.
//

struct Jelly_UnitPoint: JellyObject, Codable {
    @CodableIgnored
    var objectName: String = "Unit Point"
    @CodableIgnored
    var correctType: String = "UnitPoint"
    @CodableIgnored
    var description: String = "A unit point object from the Widgetpack app."
    
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
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "identifier", functionName: "UnitPoint"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "displayString" }) {
//                self.displayString = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "displayString", functionName: "UnitPoint"), textPosition: node.textPosition)
//            }
//        }
    }
}
