import TreeSitterJelly

import XCTest
@testable import Open_Jellycore


func execute(with testString: String, shouldFail: Bool = false) throws {
    ErrorReporter.shared.reset()
    let parser = Parser(contents: testString)
    try parser.parse()
    
    let compiler = Compiler(parser: parser)
    let _ = try compiler.compile(named: "Function Tests")
    
    if shouldFail {
        XCTAssertTrue(ErrorReporter.shared.numberOfErrors > 0)
        
        for error in ErrorReporter.shared.errors {
            print(error.errorDescription ?? "No Description", error.recoveryStrategy)
        }
    } else {
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
        }
    }
}

