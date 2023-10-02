//
//  main.swift
//  jelly
//
//  Created by Taylor Lineman on 10/1/23.
//

import Open_Jellycore
import ArgumentParser
import Foundation

@main
struct Jelly: ParsableCommand {
    @Argument(help: "The path to the file to compile")
    var file: String

    @Flag(help: "Export the shortcut to a .plist file")
    var export: Bool = false

    @Option(help: "The file path to export the compiled Jellycut too")
    var out: String? = nil

    mutating func run() throws {
        let fileManager = FileManager.default
        
        guard fileManager.isReadableFile(atPath: file) else {
            throw ValidationError("The file \(file) is not readable.")
        }

        guard let fileData = fileManager.contents(atPath: file) else {
            throw ValidationError("The file \(file) does not have a readable data type.")
        }
        
        guard let contents = String(data: fileData, encoding: .utf8) else {
            throw ValidationError("The file is not a utf8 encoded text file.")
        }
        
        EventReporter.shared.reset()
        let parser = Parser(contents: contents)
        try parser.parse()
        
        let compiler = Compiler(parser: parser)
        let compiledJellycut = try compiler.compile(named: "Function Tests")
        
        for event in EventReporter.shared.events {
            print(event.errorDescription ?? "No Description", event.recoverySuggestion ?? "No Recovery Strategies Available")
        }
        
        guard EventReporter.shared.numberOfErrors == 0 else {
            print("Found \(EventReporter.shared.events.count) errors")
            return
        }

        print("Successfully Compiled Shortcut")

        if export {
            let fileURL = URL(fileURLWithPath: file).deletingPathExtension()
            let jellycutData = compiledJellycut.data(using: .utf8)
            let exportPath: String = out ?? "./\(fileURL.lastPathComponent)"
            
            fileManager.createFile(atPath: exportPath, contents: jellycutData)
        }
    }
}
