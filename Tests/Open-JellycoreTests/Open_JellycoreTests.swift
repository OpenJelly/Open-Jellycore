import TreeSitter
import TreeSitterJelly

import XCTest
@testable import Open_Jellycore

final class Open_JellycoreTests: XCTestCase {
    var testString: String = """
    import Shortcuts
    #Color: Red #Icon: Sailboat
    
    func test() {
        return 3
    }
    
    if(ShortcutsInput == "Hello World") {
        Text("Hey!")
    } else {
        Text("Hello World")
    }
    
    repeat(3) {
        Text("Hello World")
    }
    
    repeatEach(awesome) {
        Text("Awesome")
    }
    """
    
    func testExample() throws {
        let parser = Parser(contents: testString)
        try parser.parse()
    }
}
