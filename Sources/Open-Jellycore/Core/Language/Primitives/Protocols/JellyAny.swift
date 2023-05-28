//
//  JellyAny.swift
//  
//
//  Created by Taylor Lineman on 1/2/23.
//

protocol JellyAny: Codable {
    init?(_ value: CoreNode, scopedVariables: [Variable])
    init?(_ value: CorePrimitiveNode, scopedVariables: [Variable])
}

extension JellyAny {
    init?(_ value: CorePrimitiveNode, scopedVariables: [Variable]) {
        if let coreNode = value as? CoreNode {
            self.init(coreNode, scopedVariables: scopedVariables)
        } else {
            return nil
        }
    }
}
