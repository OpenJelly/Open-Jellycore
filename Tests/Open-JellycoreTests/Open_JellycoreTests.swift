import TreeSitter
import TreeSitterJelly

import XCTest
@testable import Open_Jellycore

final class Open_JellycoreTests: XCTestCase {
    var testString: String = """
    import Shortcuts
    
    repeat 1 {
        var x = RepeatIndex
        repeat 2 {
            var y = RepeatIndex1
        }
    }
    """

    func testExample() throws {
        let parser = Parser(contents: testString)
        try parser.parse()
        
        let compiler = Compiler(parser: parser)
        let shortcut = try compiler.compile(named: "Test Shortcut")
        if ErrorReporter.shared.numberOfErrors > 0 {
            for error in ErrorReporter.shared.errors {
                print(error.errorDescription ?? "No Description", error.recoveryStrategy)
            }
            XCTFail("Found \(ErrorReporter.shared.errors.count) errors")
        } else {
            for error in ErrorReporter.shared.errors {
                print(error.errorDescription ?? "No Description", error.recoveryStrategy)
            }
            
            print("Successfully Compiled Shortcut")
            print(shortcut)
        }
    }
}
