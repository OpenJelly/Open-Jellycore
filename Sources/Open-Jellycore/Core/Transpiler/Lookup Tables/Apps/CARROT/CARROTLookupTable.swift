//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension TranspilerLookupTables {
    static var CARROTFunctions: [String : AnyAction] = [
  "currentForecast": Action<CurrentForecastParameter>(name: "Get Weather Report", identifier: "com.grailr.CARROTweather.CurrentForecastIntent", correctTypedFunction: "currentForecast", description: """
                                Get the weather for a specified location.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),

    ]
}