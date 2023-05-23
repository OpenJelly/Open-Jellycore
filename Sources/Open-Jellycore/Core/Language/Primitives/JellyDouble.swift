//
//  JellyDouble.swift
//  
//
//  Created by Taylor Lineman on 10/28/22.
//

struct JellyDouble: JellyPrimitiveType {
    typealias T = Double
    
    var value: Double
    var variable: JellyVariableReference?

    init(_ value: Double) {
        self.value = value
    }
    
    init(_ value: String) throws {
        guard let double = Double(value) else {
            let error = JellycoreError.typeError(type: "Double", description: "Unable to convert \(value) to Double")
            throw error
        }
        self.value = double
    }
    
    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        do {
            try self.init(value.content)
        } catch {
            self.init(0.0)
            // TODO: Re-setup variable references
//            self.variable = JellyVariableReference(value, scopedVariables: scopedVariables)
//            if variable?.unableToInitialize ?? false {
//                ErrorReporter.shared.report(error: error as! JellyError, textPosition: value.textPosition)
//                return nil
//            }
        }
    }
}
