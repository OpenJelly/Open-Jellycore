//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension TranspilerLookupTables {
    static var LinkBinFunctions: [String : AnyAction] = [
  "doubleColumnWidget": Action<DoubleColumnWidgetParameter>(name: "Double Column Widget", identifier: "at.davidhaydl.Really-Dumb-Link-List.DoubleColumnWidgetIntent", correctTypedFunction: "doubleColumnWidget", description: """
                                A widget with two lists of links
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "addLink": Action<AddLinkParameter>(name: "Add Link", identifier: "at.davidhaydl.Really-Dumb-Link-List.AddLinkIntent", correctTypedFunction: "addLink", description: """
                                Adds a given URL to LinkBin
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "searchForLinks": Action<SearchForLinksParameter>(name: "Search for links", identifier: "at.davidhaydl.Really-Dumb-Link-List.SearchForLinksIntent", correctTypedFunction: "searchForLinks", description: """
                                Searches links in LinkBin with a given term
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "copyLastLinksIntoClipboard": Action<CopyLastLinksIntoClipboardParameter>(name: "Copy last link into clipboard", identifier: "at.davidhaydl.Really-Dumb-Link-List.CopyLastLinksIntoClipboardIntent", correctTypedFunction: "copyLastLinksIntoClipboard", description: """
                                Copies the last link based on a given order into the clipboard
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "addLinkFromClipboard": Action<AddLinkFromClipboardParameter>(name: "Add link from clipboard", identifier: "at.davidhaydl.Really-Dumb-Link-List.AddLinkFromClipboardIntent", correctTypedFunction: "addLinkFromClipboard", description: """
                                Adds an URL from the clipboard to LinkBin
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getAllLinksForSelectedLabel": Action<GetAllLinksForSelectedLabelParameter>(name: "Get all links for label", identifier: "at.davidhaydl.Really-Dumb-Link-List.GetAllLinksForSelectedLabelIntent", correctTypedFunction: "getAllLinksForSelectedLabel", description: """
                                Fetches all links from LinkBin
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),

    ]
}