import TreeSitter
import TreeSitterJelly

import XCTest
@testable import Open_Jellycore

final class Open_JellycoreTests: XCTestCase {
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
}
