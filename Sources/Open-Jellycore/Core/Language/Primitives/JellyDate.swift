//
//  JellyDate.swift
//  
//
//  Created by Taylor Lineman on 11/6/22.
//

import Foundation

struct JellyDate: JellyPrimitiveType {    
    typealias T = Date
        
    var value: Date
    var variable: JellyVariableReference?

    init(_ value: Date) {
        self.value = value
    }
    
    init(_ value: String) throws {
        if let date = value.getDate() {
            self.value = date
        } else {
            let error = JellycoreError.typeError(type: "Date", description: "Unable to convert \(value) to Date")
            throw error
        }
    }
    
    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        do {
            try self.init(value.content)
        } catch {
            do {
                try self.init(value.content)
            } catch {

                self.init(Date())
                self.variable = JellyVariableReference(value, scopedVariables: scopedVariables)
                if variable == nil {
                    return nil
                }
            }
        }
    }
}
