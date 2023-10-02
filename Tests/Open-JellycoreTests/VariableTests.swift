import XCTest
@testable import Open_Jellycore

final class VariableTests: XCTestCase {
    func testShortcutInput() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput)
        """)
    }
    
    func testClipboard() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: Clipboard)
        """)
    }

    func testCurrentDate() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: CurrentDate)
        """)
    }

    func testAsk() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: Ask)
        """)
    }

    func testRepeatIndex() throws {
        try execute(with: """
        import Shortcuts
        
        repeat 5 {
            quicklook(input: RepeatIndex)
        }
        """)
    }
    
    func testNestedRepeatIndex() throws {
        try execute(with: """
        import Shortcuts
        
        repeat 5 {
            quicklook(input: RepeatIndex)
        
            repeat 5 {
                quicklook(input: RepeatIndex1)
            }
        }
        """)
    }

    func testRepeatItem() throws {
        try execute(with: """
        import Shortcuts
        
        repeatEach ShortcutInput {
            quicklook(input: RepeatItem)
        }
        """)
    }
    
    func testNestedRepeatItem() throws {
        try execute(with: """
        import Shortcuts
        
        repeatEach ShortcutInput {
            quicklook(input: RepeatItem)
        
            repeatEach ShortcutInput {
                quicklook(input: RepeatItem1)
            }
        }
        """)
    }
    
    func testDeviceDetails() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: DeviceDetails)
        """)
    }

}
