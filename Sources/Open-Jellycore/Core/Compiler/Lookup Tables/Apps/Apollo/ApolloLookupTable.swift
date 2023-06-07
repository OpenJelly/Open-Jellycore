//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension CompilerLookupTables {
    static var ApolloFunctions: [String : AnyAction] = [
  "openHome": Action<OpenHomeParameter>(name: "Open Home feed", identifier: "com.christianselig.Apollo.OpenHomeIntent", correctTypedFunction: "openHome", description: """
                                Opens Home feed in Apollo
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "openMultireddit": Action<OpenMultiredditParameter>(name: "Open Multireddit", identifier: "com.christianselig.Apollo.OpenMultiredditIntent", correctTypedFunction: "openMultireddit", description: """
                                Open a multireddit in Apollo
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "openUser": Action<OpenUserParameter>(name: "Open User", identifier: "com.christianselig.Apollo.OpenUserIntent", correctTypedFunction: "openUser", description: """
                                Open a user in Apollo
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "openSubreddit": Action<OpenSubredditParameter>(name: "Open Subreddit", identifier: "com.christianselig.Apollo.OpenSubredditIntent", correctTypedFunction: "openSubreddit", description: """
                                Open a subreddit in Apollo
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),

    ]
}