//
//  JellyDate.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 11/6/22.
//

import Foundation

/// This type represents a date. It can take date input in almost any date format and convert it into a Swift Date value. This value is then encoded to the proper date values that shortcuts uses.
struct JellyDate: JellyPrimitiveType {    
    typealias T = Date
        
    /// The value for a ``JellyDate`` which is a Swift Foundation Date..
    var value: Date
    /// The variable that the primitive type may by pointing too. If this variable is present, it will be encoded instead of ``JellyDate/value``.
    var variable: JellyVariableReference?

    /// The default initializer for a ``JellyDate`` which creates using a Date.
    /// - Parameter value: A date to be set as the ``JellyDate/value``
    init(_ value: Date) {
        self.value = value
    }
    
    /// Attempts to convert a string value into a date using the ``String/getDate()`` function. If the string is not convertible to a string, this function will throw.
    /// - Parameter value: The string value to convert into a Date.
    init(_ value: String) throws {
        if let date = value.getDate() {
            self.value = date
        } else {
            let error = JellycoreError.typeError(type: "Date", description: "Unable to convert \(value) to Date")
            throw error
        }
    }
    
    /// This initializer creates a ``JellyDate`` type taking in a ``CoreNode`` and the scope's variables.
    /// - Parameters:
    ///   - value: the core node to convert to a ``JellyDate``.
    ///   - scopedVariables: the variables that are in the scope of the ``JellyDate``.
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
