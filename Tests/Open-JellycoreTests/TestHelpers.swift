import TreeSitterJelly

import XCTest
@testable import Open_Jellycore


func execute(with testString: String, shouldFail: Bool = false) throws {
    EventReporter.shared.reset()
    let parser = Parser(contents: testString)
    try parser.parse()
    
    let compiler = Compiler(parser: parser)
    let _ = try compiler.compile(named: "Function Tests")
    
    if shouldFail {
        XCTAssertTrue(EventReporter.shared.numberOfErrors > 0)
        
        for error in EventReporter.shared.events {
            print(error.errorDescription ?? "No Description", error.recoveryStrategy)
        }
    } else {
        if EventReporter.shared.numberOfErrors > 0 {
            for error in EventReporter.shared.events {
                print(error.errorDescription ?? "No Description", error.recoveryStrategy)
            }
            XCTFail("Found \(EventReporter.shared.events.count) errors")
        } else {
            for error in EventReporter.shared.events {
                print(error.errorDescription ?? "No Description", error.recoveryStrategy)
            }
            
            print("Successfully Compiled Shortcut")
        }
    }
}

