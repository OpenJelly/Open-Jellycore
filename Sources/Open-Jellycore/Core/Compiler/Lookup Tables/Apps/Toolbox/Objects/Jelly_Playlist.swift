//
//  Jelly_Playlist.swift
//  
//
//  Created by Zachary Lineman on 1/5/23.
//

struct Jelly_Playlist: JellyObject, Codable {
    @CodableIgnored
    var objectName: String = "Playlist"
    @CodableIgnored
    var correctType: String = "Playlist"
    @CodableIgnored
    var description: String = "A playlist for the Toolbox Pro app."
    
    var identifier: JellyString?
    var displayString: JellyString?
    var libraryID: JellyString?

    init(_ node: CoreNode, scopedVariables: [Variable]) {
//        if let parameter = node as? ObjectNode {
//            if parameter.objectName != correctType {
//                ErrorReporter.shared.report(error: .typeError(type: objectName, description: "\(parameter.objectName) is not equivalent to the expected type \(objectName)"), textPosition: parameter.textPosition)
//                return
//            }
//
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "identifier" }) {
//                self.identifier = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "identifier", functionName: "ShortcutLabel"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "displayString" }) {
//                self.displayString = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "displayString", functionName: "ShortcutLabel"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "libraryID" }) {
//                self.libraryID = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "libraryID", functionName: "ShortcutLabel"), textPosition: node.textPosition)
//            }
//        }
    }
}
