//
//  Variable.swift
//  
//
//  Created by Taylor Lineman on 11/4/22.
//

class Variable {
    enum ValueType {
        case magicVariable
        case string
        case number
        case parameterInput
        case global
    }
        
    var uuid: String
    var name: String
    
    var valueType: ValueType
    var value: Any?
    
    init(uuid: String, name: String, valueType: Variable.ValueType, value: Any?) {
        self.uuid = uuid
        self.name = name
        self.valueType = valueType
        self.value = value
    }
}
