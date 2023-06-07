//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension TranspilerLookupTables {
    static var FocusedWorkFunctions: [String : AnyAction] = [
  "skipStage": Action<SkipStageParameter>(name: "Skip Stage", identifier: "au.com.michaeltigas.FocusedWork.SkipStageIntent", correctTypedFunction: "skipStage", description: """
                                Skip the current stage
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "restartStage": Action<RestartStageParameter>(name: "Restart Stage", identifier: "au.com.michaeltigas.FocusedWork.RestartStageIntent", correctTypedFunction: "restartStage", description: """
                                Restart the current stage
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "endFocusSession": Action<EndFocusSessionParameter>(name: "End Focus Session", identifier: "au.com.michaeltigas.FocusedWork.EndFocusSessionIntent", correctTypedFunction: "endFocusSession", description: """
                                End the current focus session
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getFocusSessions": Action<GetFocusSessionsParameter>(name: "Get Focus Sessions", identifier: "au.com.michaeltigas.FocusedWork.GetFocusSessionsIntent", correctTypedFunction: "getFocusSessions", description: """
                                Get a list of all created focus sessions
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "pauseFocusSession": Action<PauseFocusSessionParameter>(name: "Pause Focus Session", identifier: "au.com.michaeltigas.FocusedWork.PauseFocusSessionIntent", correctTypedFunction: "pauseFocusSession", description: """
                                Pause the current focus session
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getCurrentFocusSession": Action<GetCurrentFocusSessionParameter>(name: "Get Current Focus Session", identifier: "au.com.michaeltigas.FocusedWork.GetCurrentFocusSessionIntent", correctTypedFunction: "getCurrentFocusSession", description: """
                                Get the current focus session
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "setTimerVolumeLevel": Action<SetTimerVolumeLevelParameter>(name: "Set Timer Volume Level", identifier: "au.com.michaeltigas.FocusedWork.SetTimerVolumeLevelIntent", correctTypedFunction: "setTimerVolumeLevel", description: """
                                Adjust the timer volume level
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "startFocusSession": Action<StartFocusSessionParameter>(name: "Start Focus Session", identifier: "au.com.michaeltigas.FocusedWork.StartFocusSessionIntent", correctTypedFunction: "startFocusSession", description: """
                                Start a new focus session
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getLastFinishedFocusSession": Action<GetLastFinishedFocusSessionParameter>(name: "Get Last Finished Focus Session", identifier: "au.com.michaeltigas.FocusedWork.GetLastFinishedFocusSessionIntent", correctTypedFunction: "getLastFinishedFocusSession", description: """
                                Get the details of your last finished focus session
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "resumeFocusSession": Action<ResumeFocusSessionParameter>(name: "Resume Focus Session", identifier: "au.com.michaeltigas.FocusedWork.ResumeFocusSessionIntent", correctTypedFunction: "resumeFocusSession", description: """
                                Resume the current focus session
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),

    ]
}