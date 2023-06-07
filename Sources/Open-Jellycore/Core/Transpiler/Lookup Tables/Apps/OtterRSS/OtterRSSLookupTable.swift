//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension TranspilerLookupTables {
    static var OtterRSSFunctions: [String : AnyAction] = [
  "discoverFeeds": Action<DiscoverFeedsParameter>(name: "Discover Feeds", identifier: "com.joshholtz.AnOtterRSS.DiscoverFeedsIntent", correctTypedFunction: "discoverFeeds", description: """
                                Find feeds at a URL
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "exportOPML": Action<ExportOPMLParameter>(name: "Export OPML", identifier: "com.joshholtz.AnOtterRSS.ExportOPMLIntent", correctTypedFunction: "exportOPML", description: """
                                Export OPML
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "subscribeFeed": Action<SubscribeFeedParameter>(name: "Subscribe Feed", identifier: "com.joshholtz.AnOtterRSS.SubscribeFeedIntent", correctTypedFunction: "subscribeFeed", description: """
                                Subscribe Feed
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "listFolders": Action<ListFoldersParameter>(name: "List Folders", identifier: "com.joshholtz.AnOtterRSS.ListFoldersIntent", correctTypedFunction: "listFolders", description: """
                                List Folders
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "listFeeds": Action<ListFeedsParameter>(name: "List Feeds", identifier: "com.joshholtz.AnOtterRSS.ListFeedsIntent", correctTypedFunction: "listFeeds", description: """
                                List all subscribed feeds
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),

    ]
}