import TreeSitter
import TreeSitterJelly

import XCTest
@testable import Open_Jellycore

final class CoercionTests: XCTestCase {
    func testAppStoreTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(Appstore))
        """)
    }

    func testArticleTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(Article))
        """)
    }

    func testBooleanTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(Boolean))
        """)
    }

    func testContactTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(Contact))
        """)
    }

    func testDateTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(Date))
        """)
    }

    func testDictionaryTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(Dictionary))
        """)
    }

    func testEmailTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(Email))
        """)
    }

    func testFileTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(File))
        """)
    }

    func testImageTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(Image))
        """)
    }

    func testiMediaTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(iMedia))
        """)
    }

    func testiProductTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(iProduct))
        """)
    }

    func testLocationTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(Location))
        """)
    }

    func testMapLinkTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(MapLink))
        """)
    }

    func testMediaTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(Media))
        """)
    }

    func testNumberTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(Number))
        """)
    }

    func testPDFTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(PDF))
        """)
    }

    func testPhoneNumberTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(PhoneNumber))
        """)
    }

    func testPhotoTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(Photo))
        """)
    }

    func testPlaceTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(Place))
        """)
    }

    func testRichTextTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(RichText))
        """)
    }

    func testWebPageTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(WebPage))
        """)
    }

    func testURLTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(URL))
        """)
    }

    func testvCardTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(vCard))
        """)
    }

    func testStringTypeCoercion() throws {
        try execute(with: """
        import Shortcuts
        
        quicklook(input: ShortcutInput.as(String))
        """)
    }

    func testTypeCoercion() throws {
        var testString = """
        import Shortcuts
        
        """
        
        TypeCoercion.allCases.forEach({ testString.append("quicklook(input: ShortcutInput.as(\($0)))\n") })
        
        try execute(with: testString)
    }

}
