//
//  DocumentationGenerator.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/28/23.
//

/// A structure that handles the generation of documentation for all connected Jelly libraries.
public struct DocumentationGenerator {
    /// Generates documentation based on all of the available libraries.
    /// - Returns: An array of ``DocumentationLibraryEntry`` which include all of the information needed to properly display documentation for that library.
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

/// A structure that represents the documentation needed to document a Jelly library.
public struct DocumentationLibraryEntry: Identifiable {
    /// The ID of the library. Currently is the same as the library name as those are unique.
    public var id: String {
        name
    }
    
    /// The name of the library. This is human readable / pretty printed and is displayed to users.
    public var name: String
    /// The name used to import the library into Jelly code.
    public var importName: String
    /// The code used to import the library. This code can be directly copied and pasted into a Jelly script to import the library.
    public var importCode: String {
        "import " + importName
    }
    /// A description of the library for the user.
    public var description: String
    /// A list of ``DocumentationActionEntry`` that the library has contained within itself. Each action offered by the library has one of these entries.
    public var actions: [DocumentationActionEntry]
}

/// A structure that represents the documentation needed to document a Jelly action.
public struct DocumentationActionEntry: Identifiable {
    /// A structure that represents a parameter used by the action.
    public struct Parameter {
        /// The slot name for the parameter.
        var slotName: String
        /// The default value for this parameter.
        var defaultValue: String
    }
    /// The ID of the action. This is a combination of the ``DocumentationActionEntry/name`` and ``DocumentationActionEntry/correctTypedFunction``.
    public var id: String {
        name + "-" + correctTypedFunction
    }
    
    /// The name of the action that is human readable / pretty printed. Used to display the action to the user.
    public var name: String
    /// The name of the action that should be used in a functional call within a Jelly script.
    public var correctTypedFunction: String
    /// The earliest iOS version that this action supports.
    public var iOSVersion: ShortcutsHostVersion
    /// The webURL of this action. Is used to send the user to online documentation from locally generated documentation.
    public var webURL: String
    /// A description of the action, providing user context on how it works.
    public var description: String
    /// The parameters that the action accepts.
    public var parameters: [Parameter]
    
    /// A generated variable that creates a blank syntax for the action. Used to display to the user how the function is typed.
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
    
    /// A generated example for the action which uses the default values provided by the ``DocumentationActionEntry/Parameter`` structure.
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
