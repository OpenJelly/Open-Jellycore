//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension TranspilerLookupTables {
    static var ProgressFunctions: [String : AnyAction] = [
  "getTracker": Action<GetTrackerParameter>(name: "Find Tracker", identifier: "com.shayesapps.progress.GetTrackerIntent", correctTypedFunction: "getTracker", description: """
                                Finds a tracker with the specified title
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "updateNumberTracker": Action<UpdateNumberTrackerParameter>(name: "Set Tracker Value", identifier: "com.shayesapps.progress.UpdateNumberTrackerIntent", correctTypedFunction: "updateNumberTracker", description: """
                                Sets the current value of the specified tracker
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "increaseNumberTracker": Action<IncreaseNumberTrackerParameter>(name: "Increase Tracker Value", identifier: "com.shayesapps.progress.IncreaseNumberTrackerIntent", correctTypedFunction: "increaseNumberTracker", description: """
                                Increases the current value of the specified tracker
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "updateNumberTrackerTarget": Action<UpdateNumberTrackerTargetParameter>(name: "Set Tracker Target Value", identifier: "com.shayesapps.progress.UpdateNumberTrackerTargetIntent", correctTypedFunction: "updateNumberTrackerTarget", description: """
                                Sets the target value of the specified tracker
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getNumberTrackerValue": Action<GetNumberTrackerValueParameter>(name: "Get Tracker Value", identifier: "com.shayesapps.progress.GetNumberTrackerValueIntent", correctTypedFunction: "getNumberTrackerValue", description: """
                                Gets the current value of the specified tracker
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "decreaseNumberTracker": Action<DecreaseNumberTrackerParameter>(name: "Decrease Tracker Value", identifier: "com.shayesapps.progress.DecreaseNumberTrackerIntent", correctTypedFunction: "decreaseNumberTracker", description: """
                                Decreases the current value of the specified tracker
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),

    ]
}