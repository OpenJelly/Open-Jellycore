//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension TranspilerLookupTables {
    static var GizmoPackFunctions: [String : AnyAction] = [
  "createWalletPass": Action<CreateWalletPassParameter>(name: "Create Wallet Pass", identifier: "ke.bou.GizmoPack.CreateWalletPassIntent", correctTypedFunction: "createWalletPass", description: """
                                Create a Wallet Pass. Colors should be specified in CSS-style rgb(1, 2, 3) format. Add 'Add Wallet Pass' action after this one to add it to your Wallet.
                                This action requires GizmoPack Pro.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "queryJSON": Action<QueryJSONParameter>(name: "Process JSON with JSONPath/jq", identifier: "ke.bou.GizmoPack.QueryJSONIntent", correctTypedFunction: "queryJSON", description: """
                                Process JSON using JSONPath or jq.

                                This action requires GizmoPack Pro.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "addWalletPass": Action<AddWalletPassParameter>(name: "Add Wallet Pass", identifier: "ke.bou.GizmoPack.AddWalletPassIntent", correctTypedFunction: "addWalletPass", description: """
                                Add Pass to Wallet. Add 'Wait to return' after this action to pause execution until done. Pressing 'Preview' does nothing.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "fuzzyFinder": Action<FuzzyFinderParameter>(name: "Fuzzy Finder", identifier: "ke.bou.GizmoPack.FuzzyFinderIntent", correctTypedFunction: "fuzzyFinder", description: """
                                Interactively select an item from a list using your keyboard. This action opens a search box that allows you to quickly search through a list of items to find the one you're looking for.
                                Add a 'Wait to return' and 'Get clipboard' action after this one to get the result.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "generateCSV": Action<GenerateCSVParameter>(name: "Generate CSV", identifier: "ke.bou.GizmoPack.GenerateCSVIntent", correctTypedFunction: "generateCSV", description: """
                                Generate CSV from list of Dictionaries
                                This action requires GizmoPack Pro.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "trimFile": Action<TrimFileParameter>(name: "Trim File", identifier: "ke.bou.GizmoPack.TrimFileIntent", correctTypedFunction: "trimFile", description: """
                                Trim file by removing lines or spaces.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "queryDocument": Action<QueryDocumentParameter>(name: "Scrape HTML/XML with CSS/XPath", identifier: "ke.bou.GizmoPack.QueryDocumentIntent", correctTypedFunction: "queryDocument", description: """
                                Query HTML or XML document using CSS or XPath queries.
                                CSS 3.0 selectors, and XPath 1.0 is supported.
                                This action requires GizmoPack Pro.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "universalVariables": Action<UniversalVariablesParameter>(name: "Universal Variables", identifier: "ke.bou.GizmoPack.UniversalVariablesIntent", correctTypedFunction: "universalVariables", description: """
                                Manipulate universal variables.

                                An internet connection is required.

                                Public values are readable and writable by everyone.
                                Protected values are readable by everyone and writable by the creator.
                                Private values are readable and writable by only the creator.

                                Set overwrites a value.
                                Get retrieves a value.
                                Add adds an item to a value.
                                Delete deletes a value.
                                Remove deletes an item from a value.
                                Get all retrieves the name of all the values you have set.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "snapshotMap": Action<SnapshotMapParameter>(name: "Snapshot Map", identifier: "ke.bou.GizmoPack.SnapshotMapIntent", correctTypedFunction: "snapshotMap", description: """
                                Take a snapshot of a map location.
                                Latitude is the distance from top to bottom in the picture. Increase it to zoom out further.
                                Width and Height are multiplied by the pixel density of your device.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "signJWT": Action<SignJWTParameter>(name: "Sign JSON Web Token", identifier: "ke.bou.GizmoPack.SignJWTIntent", correctTypedFunction: "signJWT", description: """
                                Sign a JSON Web Token with a private key.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "fileInfo": Action<FileInfoParameter>(name: "File Info", identifier: "ke.bou.GizmoPack.FileInfoIntent", correctTypedFunction: "fileInfo", description: """
                                Retrieve file path, name, type.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "shortcutMetadata": Action<ShortcutMetadataParameter>(name: "Shortcut Metadata", identifier: "ke.bou.GizmoPack.ShortcutMetadataIntent", correctTypedFunction: "shortcutMetadata", description: """
                                Get metadata of shortcut.

                                Returns:
                                - Number of actions
                                - Hex color
                                - System symbol name (if available)
                                - First comment at the top of the shortcut

                                This action requires GizmoPack Pro.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "combineLists": Action<CombineListsParameter>(name: "Combine Lists", identifier: "ke.bou.GizmoPack.CombineListsIntent", correctTypedFunction: "combineLists", description: """
                                Combine two lists by joining, intersecting or subtracting.

                                Joining combines the two lists into one.
                                Intersecting creates a list of all the elements in the first that are also in the second.
                                Subtracting creates a list of all the elements in the first that are not in the second.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "encodeHex": Action<EncodeHexParameter>(name: "Hex Encode", identifier: "ke.bou.GizmoPack.EncodeHexIntent", correctTypedFunction: "encodeHex", description: """
                                Encodes or decodes text of files using Hex encoding.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "parseCSV": Action<ParseCSVParameter>(name: "Parse CSV", identifier: "ke.bou.GizmoPack.ParseCSVIntent", correctTypedFunction: "parseCSV", description: """
                                Parse CSV into list of Dictionaries. Detecting the delimiter only looks at the filename.
                                This action requires GizmoPack Pro.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "randomData": Action<RandomDataParameter>(name: "Random Data", identifier: "ke.bou.GizmoPack.RandomDataIntent", correctTypedFunction: "randomData", description: """
                                Generate cryptographically secure random data. Output as binary, hex or Base64.

                                This action requires GizmoPack Pro.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "queryRecords": Action<QueryRecordsParameter>(name: "Query CSV/Dictionaries with SQL", identifier: "ke.bou.GizmoPack.QueryRecordsIntent", correctTypedFunction: "queryRecords", description: """
                                Query a CSV file or list of JSON Dictionaries using SQL statement.

                                You can use all the Sqlite functions, and a custom function 'parsedate(string, format)' that uses the same format as 'Parse Date'.

                                This action requires GizmoPack Pro.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "filterDictionaries": Action<FilterDictionariesParameter>(name: "Filter Dictionaries", identifier: "ke.bou.GizmoPack.FilterDictionariesIntent", correctTypedFunction: "filterDictionaries", description: """
                                Filter a list of JSON Dictionaries
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "parseDate": Action<ParseDateParameter>(name: "Parse Date", identifier: "ke.bou.GizmoPack.ParseDateIntent", correctTypedFunction: "parseDate", description: """
                                Interpret date with custom format.
                                A date like 12/25/2001 can be parsed with format 'MM/dd/yyyy'.
                                This action requires GizmoPack Pro.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "encodePlist": Action<EncodePlistParameter>(name: "Encode Property List", identifier: "ke.bou.GizmoPack.EncodePlistIntent", correctTypedFunction: "encodePlist", description: """
                                Encode/decode a property list as a JSON Dictionary.

                                You can use this to inspect the underlying code of a shortcut. Use 'Get Link to File' after encoding it back to a property list to import the shortcut into the Shortcuts app.

                                This action requires GizmoPack Pro.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "hashData": Action<HashDataParameter>(name: "Generate Hash (Extended)", identifier: "ke.bou.GizmoPack.HashDataIntent", correctTypedFunction: "hashData", description: """
                                Generate hash digest of input.

                                Supported algorithms:
                                - MD2
                                - MD4
                                - MD5
                                - SHA-1
                                - SHA-224
                                - SHA-384
                                - SHA-512
                                - HMAC-MD5
                                - HMAC-SHA1
                                - HMAC-SHA224
                                - HMAC-SHA384
                                - HMAC-SHA512

                                This action requires GizmoPack Pro.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "overwriteFile": Action<OverwriteFileParameter>(name: "Overwrite File", identifier: "ke.bou.GizmoPack.OverwriteFileIntent", correctTypedFunction: "overwriteFile", description: """
                                Overwrite a passed in file with the contents of another.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),

    ]
}
