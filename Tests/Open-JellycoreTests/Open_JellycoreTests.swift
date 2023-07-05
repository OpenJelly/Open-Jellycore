import TreeSitter
import TreeSitterJelly

import XCTest
@testable import Open_Jellycore

final class Open_JellycoreTests: XCTestCase {
    func testFunctions() throws {
        let testString: String = """
        import Shortcuts
        
        func test() {
            return "Hello"
        }
        
        test()
        """

        ErrorReporter.shared.reset()
        let parser = Parser(contents: testString)
        try parser.parse()
        
        let compiler = Compiler(parser: parser)
        let shortcut = try compiler.compile(named: "Function Tests")
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

    func testConditional() throws {
        let testString: String = """
        import Shortcuts
        
        if ShortcutInput == "Hello" {
            quicklook(input: ShortcutInput)
        }
        """

        ErrorReporter.shared.reset()
        let parser = Parser(contents: testString)
        try parser.parse()
        
        let compiler = Compiler(parser: parser)
        let shortcut = try compiler.compile(named: "Function Tests")
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
