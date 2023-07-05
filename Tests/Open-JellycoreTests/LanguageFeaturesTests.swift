import TreeSitter
import TreeSitterJelly

import XCTest
@testable import Open_Jellycore

final class OpenJellycoreTests: XCTestCase {
    func testFunctions() throws {
        try execute(with: """
        import Shortcuts
        
        func test() {
            return "Hello"
        }
        
        test()
        """)
    }

    func testConditional() throws {
        try execute(with: """
        import Shortcuts
        
        if ShortcutInput == "Hello" {
            quicklook(input: ShortcutInput)
        }
        """)
    }
    
    func testConditionalBoolean() throws {
        // This should fail because repeatEach does not except a raw number
        try execute(with: """
        import Shortcuts
        
        if ShortcutInput.as(Boolean) {
            quicklook(input: ShortcutInput)
        }
        """)
    }
    
    func testRepeat() throws {
        try execute(with: """
        import Shortcuts
        
        repeat 100 {
            text(text: RepeatIndex)
        }
        """)
    }
    
    func testRepeatEach() throws {
        // This should fail because repeatEach does not except a raw number
        try execute(with: """
        import Shortcuts
        
        repeatEach 100 {
            text(text: RepeatIndex)
        }
        """, shouldFail: true)
        
        try execute(with: """
        import Shortcuts
        
        repeatEach ShortcutInput {
            text(text: RepeatIndex)
        }
        """)
    }
    
    func testMenu() throws {
        try execute(with: """
        import Shortcuts
        
        menu "Hello World!" {
        case "Case One":
            quicklook(input: ShortcutInput)
        case "Case Two":
            quicklook(input: ShortcutInput)
        }
        """)
    }

    
}
