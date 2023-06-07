import TreeSitter
import TreeSitterJelly

import XCTest
@testable import Open_Jellycore

final class Open_JellycoreTests: XCTestCase {
    var testString: String = """
    import Shortcuts
    #Icon: sailboat
    #Color: blue
    
    func hello(text) {
        
    }
    
    hello(text: "World")
    """

    func testExample() throws {
        let parser = Parser(contents: testString)
        try parser.parse()
        
        let transpiler = Transpiler(parser: parser)
        let shortcut = try transpiler.compile(named: "Test Shortcut")
        if !ErrorReporter.shared.errors.isEmpty {
            for error in ErrorReporter.shared.errors {
                print(error.errorDescription ?? "No Description", error.recoveryStrategy)
            }
            XCTFail("Found \(ErrorReporter.shared.errors.count) errors")
        } else {
            print("Successfully Compiled Shortcut")
            print(shortcut)
        }
    }
}
