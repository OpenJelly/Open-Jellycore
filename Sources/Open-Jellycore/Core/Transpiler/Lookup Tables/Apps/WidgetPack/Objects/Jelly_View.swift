//
//  Jelly_View.swift
//  
//
//  Created by Zachary Lineman on 1/5/23.
//

struct Jelly_View: JellyObject, Codable {
    @CodableIgnored
    var objectName: String = "View"
    @CodableIgnored
    var correctType: String = "View"
    @CodableIgnored
    var description: String = "A view object from the Widgetpack app."
    
    
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
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "identifier", functionName: "View"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "displayString" }) {
//                self.displayString = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "displayString", functionName: "View"), textPosition: node.textPosition)
//            }
//        }
    }
}
