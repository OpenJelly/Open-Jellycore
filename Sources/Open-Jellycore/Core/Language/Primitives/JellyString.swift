//
//  JellyString.swift
//  
//
//  Created by Taylor Lineman on 10/28/22.
//

struct JellyString: JellyPrimitiveType {
    typealias T = String
    
    enum EncodingKeys: String, CodingKey {
        case value = "Value"
        case serializationType = "WFSerializationType"
    }

    var value: String
    var variable: JellyVariableReference? = nil
    var attachmentsByRange: [String: JellyVariableReference] = [:]

    init(_ value: T) {
        self.value = value
    }
    
    init(_ value: CoreNode) {
        if let stringNode = value as? StringNode {
            self.init(stringNode.content)
            // TODO: Re-setup string interpolation
        } else {
            self.init(value.content)
        }
    }

    // TODO: Re-setup string interpolation
//        for child in childrenNodes {
//            if let child = child as? StringInterpolationNode {
//                let key = "{\(child.start), 1}"
//                var variableReference = JellyVariableReference(child.variableCall, variables: scopedVariables, textPosition: value.textPosition)
//                variableReference.needsValueKey = false
//                variableReference.needsSerialization = false
//
//                attachmentsByRange.merge([key: variableReference]) { first, _ in
//                    return first
//                }
//                self.value = self.value.replacingOccurrences(of: "${\(child.content)}", with: "￼")
//            }
//        }
//    init(_ value: String, scopedVariables: [Variable]) {
//        let stringAggrandizements = JellyParser.getInterpolationInString(textPosition: .zero, content: value)
//        self.init(ParserNode(type: .string, content: value, textPosition: .zero), childrenNodes: stringAggrandizements, scopedVariables: scopedVariables)
//    }
//    
//    init(_ value: ParserNode, scopedVariables: [Variable]) {
//        let stringAggrandizements = JellyParser.getInterpolationInString(textPosition: .zero, content: value.content)
//        self.init(value, childrenNodes: stringAggrandizements, scopedVariables: scopedVariables)
//    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: EncodingKeys.self)

        let outerDictionary: [String: QuantumValue] = [
            "attachmentsByRange": QuantumValue(attachmentsByRange),
            "string": QuantumValue(value)
        ]
        
        try container.encode(outerDictionary, forKey: .value)
        try container.encode("WFTextTokenString", forKey: .serializationType)
    }
}
/*
 <key>WFTextActionText</key>
 <dict>
     <key>Value</key>
     <dict>
         <key>attachmentsByRange</key>
         <dict>
             <key>{6, 1}</key>
             <dict>
                 <key>Type</key>
                 <string>ExtensionInput</string>
             </dict>
         </dict>
         <key>string</key>
         <string>Hello ￼</string>
     </dict>
     <key>WFSerializationType</key>
     <string>WFTextTokenString</string>
 </dict>

 <key>WFTextActionText</key>
 <dict>
     <key>Value</key>
     <dict>
         <key>attachmentsByRange</key>
         <dict>
             <key>{7, 1}</key>
             <dict>
                 <key>Aggrandizements</key>
                 <array/>
                 <key>Type</key>
                 <string>ExtensionInput</string>
                 <key>VariableName</key>
                 <string>ShortcutInput</string>
             </dict>
         </dict>
         <key>string</key>
         <string>Hello ￼</string>
     </dict>
     <key>WFSerializationType</key>
     <string>WFTextTokenString</string>
 </dict>

 */
