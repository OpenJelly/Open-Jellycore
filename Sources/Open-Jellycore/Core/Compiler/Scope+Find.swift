//
//  Scope+Find.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 7/5/23.
//

import Foundation

extension Scope {
    /// Find's a given variable in a given array. If the variable is not available in the given array, the global variable array will be searched as well. If neither contain the variable nil will be returned
    /// - Parameters:
    ///   - name: The name of the variable to search based on
    ///   - array: The array of variables to search
    /// - Returns: A possible match for the variable. Matched based on the name.
    static func find(_ name: String, in array: [Variable]) -> Variable? {
        if let variable = array.first(where: { variable in
            return variable.name == name
        }) {
            return variable
        } else if let variable = Scope.globalVariables.first(where: { variable in
            return variable.name == name
        }) {
            return variable
        }
        return nil
    }
}
