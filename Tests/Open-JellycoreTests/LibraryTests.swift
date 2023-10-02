import XCTest
@testable import Open_Jellycore

final class LibraryTests: XCTestCase {
    func testImportAllLibraries() throws {
        var testString = ""
        
        CompilerLookupTables.Library.allCases.forEach({ testString.append("import \($0)\n") })
        try execute(with: testString)
    }
    
    func testShortcutLibraryImport() throws {
        try execute(with: """
        import Shortcuts
        """)
    }
    
    func testToolboxProLibraryImport() throws {
        try execute(with: """
        import ToolboxPro
        """)
    }
    
    func testDataJarLibraryImport() throws {
        try execute(with: """
        import DataJar
        """)
    }
    
    func testCarrotLibraryImport() throws {
        try execute(with: """
        import CARROT
        """)
    }

    func testApolloLibraryImport() throws {
        try execute(with: """
        import Apollo
        """)
    }

    func testAShellLibraryImport() throws {
        try execute(with: """
        import AShell
        """)
    }

    func testScriptableLibraryImport() throws {
        try execute(with: """
        import Scriptable
        """)
    }

    func testRubyistLibraryImport() throws {
        try execute(with: """
        import Rubyist
        """)
    }

    func testNudgetLibraryImport() throws {
        try execute(with: """
        import Nudget
        """)
    }

    func testRecurrenceLibraryImport() throws {
        try execute(with: """
        import Recurrence
        """)
    }

    func testJellycutsLibraryImport() throws {
        try execute(with: """
        import Jellycuts
        """)
    }

    func testWallpaperAppLibraryImport() throws {
        try execute(with: """
        import WallpaperApp
        """)
    }

    func testOtterRSSLibraryImport() throws {
        try execute(with: """
        import OtterRSS
        """)
    }

    func testProgressLibraryImport() throws {
        try execute(with: """
        import Progress
        """)
    }

    func testGizmoPackLibraryImport() throws {
        try execute(with: """
        import GizmoPack
        """)
    }

    func testLinkBinLibraryImport() throws {
        try execute(with: """
        import LinkBin
        """)
    }

    func testAShellMiniLibraryImport() throws {
        try execute(with: """
        import AShellMini
        """)
    }
    
    func testFocusedWorkLibraryImport() throws {
        try execute(with: """
        import FocusedWork
        """)
    }
    
    func testDraftsLibraryImport() throws {
        try execute(with: """
        import Drafts
        """)
    }
    
    func testWidgetPackLibraryImport() throws {
        try execute(with: """
        import WidgetPack
        """)
    }

    func testActionsLibraryImport() throws {
        try execute(with: """
        import Actions
        """)
    }
}
