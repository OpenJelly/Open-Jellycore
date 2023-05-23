//
//  ShortcutsLookup.swift
//  
//
//  Created by Taylor Lineman on 10/28/22.
//

//        "test": Action<TestParameter>(name: "Test", identifier: "test", correctTypedFunction: "test", description: """
//                                       Some basic text
//                                       """, lowestCompatibleHost: .iOS13, presets: []),
//        "text": Action<TextParameter>(name: "Text", identifier: "is.workflow.actions.gettext", correctTypedFunction: "text", description: """
//                                       Some basic text
//                                       """, lowestCompatibleHost: .iOS13, presets: []),
//        "number": Action<NumberParameter>(name: "Number", identifier: "is.workflow.actions.number", correctTypedFunction: "number", description: """
//                                       A basic number
//                                       """, lowestCompatibleHost: .iOS13, presets: []),

extension TranspilerLookupTables {
    static var shortcutsFunctions: [String : AnyAction] = [
        "text": Action<TextParameter>(name: "Text", identifier: "is.workflow.actions.gettext", correctTypedFunction: "text", description: "Declares text. Basically just a string.", lowestCompatibleHost: .iOS14, presets: []),
    ]
}
