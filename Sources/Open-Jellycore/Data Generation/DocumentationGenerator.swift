//
//  DocumentationGenerator.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/28/23.
//

public struct DocumentationGenerator {
    public static func generateDocumentation() -> [DocumentationLibraryEntry] {
        var libraries: [DocumentationLibraryEntry] = []
        
        for library in TranspilerLookupTables.Library.allCases {
            var actions: [DocumentationActionEntry] = []
            let anyActions = library.functionTable.compactMap({$0.value})
            
            for anyAction in anyActions {
                let webURL = "https://jellycuts.com/docs/Documentation/\(library.rawValue)/\(anyAction.correctTypedFunction)/"
                let parameters: [DocumentationActionEntry.Parameter] = anyAction.getDefaultParameters().compactMap { key, value in
                    return DocumentationActionEntry.Parameter(slotName: key, defaultValue: value)
                }
                
                actions.append(DocumentationActionEntry(name: anyAction.name, correctTypedFunction: anyAction.correctTypedFunction, iOSVersion: anyAction.lowestCompatibleHost, webURL: webURL, description: anyAction.description, parameters: parameters))
            }
            
            libraries.append(DocumentationLibraryEntry(name: library.prettyName, importName: library.rawValue, description: library.description, actions: actions))
        }
        
        return libraries
    }
}

public struct DocumentationLibraryEntry: Identifiable {
    public var id: String {
        name
    }
    
    public var name: String
    public var importName: String
    public var importCode: String {
        "import " + importName
    }
    public var description: String
    public var actions: [DocumentationActionEntry]
}

public struct DocumentationActionEntry: Identifiable {
    public struct Parameter {
        var slotName: String
        var defaultValue: String
    }
    
    public var id: String {
        name + "-" + correctTypedFunction
    }
    
    public var name: String
    public var correctTypedFunction: String
    public var fileName: String = ""
    public var iOSVersion: ShortcutsHostVersion
    public var webURL: String
    public var description: String
    public var parameters: [Parameter]
    
    public var syntax: String {
        var example = correctTypedFunction + "("
        
        for (index, item) in parameters.enumerated() {
            example += item.slotName
            example += ":_"
            if index < parameters.count - 1 {
                example += ", "
            }
        }
        
        return example + ")"
    }
    
    public var example: String {
        var example = correctTypedFunction + "("
        
        for (index, item) in parameters.enumerated() {
            example += item.slotName + ": " + item.defaultValue
            if index < parameters.count - 1 {
                example += ", "
            }
        }

        return example + ")"
    }
}
