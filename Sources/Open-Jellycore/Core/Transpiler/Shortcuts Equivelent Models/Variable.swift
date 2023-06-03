//
//  Variable.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 11/4/22.
//

/// A variable used by Jelly to keep track of variables before they are converted into Shortcuts variables.
/// These variables have more functionality than is currently used, specifically the value type. This value type can be used to detect if a function will actually accept a variable.
final class Variable {
    /// Represents a type of value that a variable can contain.
    enum ValueType {
        case magicVariable
        case string
        case number
        case parameterInput
        case global
    }
        
    /// The UUID of the variable
    var uuid: String
    /// The name of the variable
    var name: String
    
    /// The type of value that is being held by this variable
    var valueType: ValueType
    /// A possible value that the variable contains
    var value: Any?
    
    /// A simple constructor for a variable
    /// - Parameters:
    ///   - uuid: The variables UUID. Shortcuts uses these values to match variables ~ sometimes
    ///   - name: The name of the variable. Used to call it whenever necessary.
    ///   - valueType: The value type that is stored in `value`
    ///   - value: The value, if any, that this variable currently contains
    init(uuid: String, name: String, valueType: Variable.ValueType, value: Any?) {
        self.uuid = uuid
        self.name = name
        self.valueType = valueType
        self.value = value
    }
}
