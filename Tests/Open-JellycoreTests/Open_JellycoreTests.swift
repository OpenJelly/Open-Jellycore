import TreeSitter
import TreeSitterJelly

import XCTest
@testable import Open_Jellycore

final class Open_JellycoreTests: XCTestCase {
    var testString: NSString = """
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
        let jelly = tree_sitter_jelly()
        let parser: OpaquePointer = ts_parser_new()
        ts_parser_set_language(parser, jelly)
        
        // Multiply by two because NSString is UTF-16 encoded
        var usedLength = 0
        let encoding: String.Encoding = .utf16
        let stringByteLength = testString.length * 2
        let range = NSRange(location: 0, length: testString.length)
        let buffer = UnsafeMutablePointer<Int8>.allocate(capacity: stringByteLength)
        
        guard testString.getBytes(buffer, maxLength: stringByteLength, usedLength: &usedLength, encoding: encoding.rawValue, range: range, remaining: nil) else {
            print("Unable to get string bytes")
            return
        }
        
        let treePointer: OpaquePointer? = ts_parser_parse_string_encoding(parser, nil, buffer, UInt32(stringByteLength), TSInputEncodingUTF16)
        let tree = try TreeSitterTree(rawTreePtr: treePointer)
        let rootNode = tree.rootNode()
        rootNode.getChildren().forEach({print($0.string ?? "No String")})
        
    }
}
