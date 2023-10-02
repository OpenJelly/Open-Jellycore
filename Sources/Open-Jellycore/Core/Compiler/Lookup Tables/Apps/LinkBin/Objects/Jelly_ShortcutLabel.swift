//
//  Jelly_ShortcutLabel.swift
//  
//
//  Created by Zachary Lineman on 1/5/23.
//

struct Jelly_ShortcutLabel: JellyObject, Codable {
    @CodableIgnored
    var objectName: String = "Shortcut LinkBin Label"
    @CodableIgnored
    var correctType: String = "ShortcutLabel"
    @CodableIgnored
    var description: String = "A LinkBin Label"
    
    var identifier: JellyString?
    var displayString: JellyString?

    init(_ node: CoreNode, scopedVariables: [Variable]) {
//        if let parameter = node as? ObjectNode {
//            if parameter.objectName != correctType {
//                EventReporter.shared.report(error: .typeError(type: objectName, description: "\(parameter.objectName) is not equivalent to the expected type \(objectName)"), textPosition: parameter.textPosition)
//                return
//            }
//
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "identifier" }) {
//                self.identifier = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "identifier", functionName: "ShortcutLabel"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "displayString" }) {
//                self.displayString = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "displayString", functionName: "ShortcutLabel"), textPosition: node.textPosition)
//            }
//        }
    }
}
