//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension CompilerLookupTables {
    static var ActionsFunctions: [String : AnyAction] = [
  "isConnectedToVPN": Action<IsConnectedToVPNParameter>(name: "Is Connected to VPN (iOS-only)", identifier: "com.sindresorhus.Actions.IsConnectedToVPNIntent", correctTypedFunction: "isConnectedToVPN", description: """
                                Returns whether the device is connected to a VPN.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "getMusicPlaylists": Action<GetMusicPlaylistsParameter>(name: "Get Music Playlists (iOS-only)", identifier: "com.sindresorhus.Actions.GetMusicPlaylistsIntent", correctTypedFunction: "getMusicPlaylists", description: """
                                Gets the names of the playlists in your Music library.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "removeDuplicatesFromList": Action<RemoveDuplicatesFromListParameter>(name: "Remove Duplicates from List", identifier: "com.sindresorhus.Actions.RemoveDuplicatesFromListIntent", correctTypedFunction: "removeDuplicatesFromList", description: """
                                Removes duplicates from the input list. List elements are coerced to text before being compared.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "removeFromList": Action<RemoveFromListParameter>(name: "Remove from List", identifier: "com.sindresorhus.Actions.RemoveFromListIntent", correctTypedFunction: "removeFromList", description: """
                                Removes items from the input list. It uses 1-based indexing. Even though the description says this action accepts input of type "Files", it accepts any type.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "isSilentModeOn": Action<Actions_IsSilentModeOnParameter>(name: "Is Silent Mode On (iOS-only)", identifier: "com.sindresorhus.Actions.IsSilentModeOnIntent", correctTypedFunction: "isSilentModeOn", description: """
                                Returns whether the silent switch (mute) is enabled on the device.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "reverseList": Action<Actions_ReverseListParameter>(name: "Reverse List", identifier: "com.sindresorhus.Actions.ReverseListIntent", correctTypedFunction: "reverseList", description: """
                                Reverses the input list. Even though the description says this action accepts input of type "Files", it can handle lists of any type.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "combineLists": Action<Actions_CombineListsParameter>(name: "Combine Lists", identifier: "com.sindresorhus.Actions.CombineListsIntent", correctTypedFunction: "combineLists", description: """
                                Combines two or more lists into one list. Supports up to 10 lists. Even though the description says this action accepts input of type "Files", it accepts any type.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "removeNonPrintableCharacters": Action<RemoveNonPrintableCharactersParameter>(name: "Remove Non-Printable Characters", identifier: "com.sindresorhus.Actions.RemoveNonPrintableCharactersIntent", correctTypedFunction: "removeNonPrintableCharacters", description: """
                                Removes non-printable (invisible) Unicode characters from the input text, excluding normal whitespace characters. This can be useful to clean up input text which might contain things like left-to-right embedding, control characters, etc.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "writeText": Action<WriteTextParameter>(name: "Write or Edit Text", identifier: "com.sindresorhus.Actions.WriteTextIntent", correctTypedFunction: "writeText", description: """
                                Opens a text editor where you can write or edit text. The result is copied to the clipboard. Add the “Wait to Return” and “Get Clipboard” actions after this one.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "shuffleList": Action<Actions_ShuffleListParameter>(name: "Shuffle List", identifier: "com.sindresorhus.Actions.ShuffleListIntent", correctTypedFunction: "shuffleList", description: """
                                Shuffles the input list. Even though the description says this action accepts input of type "Files", it can handle lists of any type.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "addToList": Action<Actions_AddToListParameter>(name: "Add to List", identifier: "com.sindresorhus.Actions.AddToListIntent", correctTypedFunction: "addToList", description: """
                                Adds the input item to the given list. Even though the description says this action accepts input of type "Files", it accepts any type.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "randomFloatingPointNumber": Action<RandomFloatingPointNumberParameter>(name: "Random Floating-Point Number", identifier: "com.sindresorhus.Actions.RandomFloatingPointNumberIntent", correctTypedFunction: "randomFloatingPointNumber", description: """
                                Returns a random floating-point number between the given minimum and maximum.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "editURL": Action<EditURLParameter>(name: "Edit URL", identifier: "com.sindresorhus.Actions.EditURLIntent", correctTypedFunction: "editURL", description: """
                                Lets you edit the components of the input URL. For example, add a query item, change the path, or remove the fragment.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "clampNumber": Action<ClampNumberParameter>(name: "Clamp Number", identifier: "com.sindresorhus.Actions.ClampNumberIntent", correctTypedFunction: "clampNumber", description: """
                                Clamps the input number to above or equal to the given minimum number and below or equal to the given maximum number.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "removeEmoji": Action<Actions_RemoveEmojiParameter>(name: "Remove Emojis", identifier: "com.sindresorhus.Actions.RemoveEmojiIntent", correctTypedFunction: "removeEmoji", description: """
                                Removes all emojis in the input text.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "setFileCreationModificationDate": Action<SetFileCreationModificationDateParameter>(name: "Set Creation and Modification Date of File", identifier: "com.sindresorhus.Actions.SetFileCreationModificationDateIntent", correctTypedFunction: "setFileCreationModificationDate", description: """
                                Sets the creation and modification date of a file to a new value.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "hideShortcutsApp": Action<HideShortcutsAppParameter>(name: "Hide Shortcuts App", identifier: "com.sindresorhus.Actions.HideShortcutsAppIntent", correctTypedFunction: "hideShortcutsApp", description: """
                                Hides the Shortcuts app. This is useful for making cross-platform shortcuts. If you just target iOS, use the built-in “Go to Home Screen” action instead.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "applyCaptureDate": Action<ApplyCaptureDateParameter>(name: "Apply Capture Date", identifier: "com.sindresorhus.Actions.ApplyCaptureDateIntent", correctTypedFunction: "applyCaptureDate", description: """
                                Applies the original capture date & time of the photo (from Exif metadata) to the file's creation and modification date. If an image does not have a capture date metadata, the file is just passed through. This action can be useful to run after the "Convert Image" action (ensure "Preserve Metadata" is checked).
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "getFilePath": Action<GetFilePathParameter>(name: "Get File Path", identifier: "com.sindresorhus.Actions.GetFilePathIntent", correctTypedFunction: "getFilePath", description: """
                                Get the path or URL to the input file.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "dateToUnixTime": Action<DateToUnixTimeParameter>(name: "Date to Unix Time", identifier: "com.sindresorhus.Actions.DateToUnixTimeIntent", correctTypedFunction: "dateToUnixTime", description: """
                                Gets the Unix time for the input date. Write "now" as the date to get it for the currentdate and time. Unix time (also known as Epoch time) is a system for describing a point in time — the number of seconds that have elapsed since the Unix epoch.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "randomDateTime": Action<RandomDateTimeParameter>(name: "Random Date and Time", identifier: "com.sindresorhus.Actions.RandomDateTimeIntent", correctTypedFunction: "randomDateTime", description: """
                                Returns a random date and time in the given range.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "randomColor": Action<RandomColorParameter>(name: "Random Color", identifier: "com.sindresorhus.Actions.RandomColorIntent", correctTypedFunction: "randomColor", description: """
                                Gets a random color. Returns the color in Hex format.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "isDarkMode": Action<IsDarkModeParameter>(name: "Is Dark Mode On", identifier: "com.sindresorhus.Actions.IsDarkModeIntent", correctTypedFunction: "isDarkMode", description: """
                                Returns whether dark mode is enabled on the device.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "transformText": Action<TransformTextParameter>(name: "Transform Text", identifier: "com.sindresorhus.Actions.TransformTextIntent", correctTypedFunction: "transformText", description: """
                                Transforms the input text to camel case, pascal case, snake case, constant case, or dash case.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "getEmojis": Action<GetEmojisParameter>(name: "Get Emojis", identifier: "com.sindresorhus.Actions.GetEmojisIntent", correctTypedFunction: "getEmojis", description: """
                                Gets all emojis in the input text.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "getAudioPlaybackDestination": Action<GetAudioPlaybackDestinationParameter>(name: "Get Audio Playback Destination (iOS-only)", identifier: "com.sindresorhus.Actions.GetAudioPlaybackDestinationIntent", correctTypedFunction: "getAudioPlaybackDestination", description: """
                                Gets the audio playback destination of the device. Can be useful in combination with the built-in "Set Playback Destination" action.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "isBluetoothOn": Action<IsBluetoothOnParameter>(name: "Is Bluetooth On", identifier: "com.sindresorhus.Actions.IsBluetoothOnIntent", correctTypedFunction: "isBluetoothOn", description: """
                                Returns whether Bluetooth is on or off.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "getUniformTypeIdentifier": Action<GetUniformTypeIdentifierParameter>(name: "Get Uniform Type Identifier", identifier: "com.sindresorhus.Actions.GetUniformTypeIdentifierIntent", correctTypedFunction: "getUniformTypeIdentifier", description: """
                                Gets the Uniform Type Identifier (UTI) of the input file. For example, a JPEG file would return “public.jpeg”.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "formatDateDifference": Action<FormatDateDifferenceParameter>(name: "Format Date Difference", identifier: "com.sindresorhus.Actions.FormatDateDifferenceIntent", correctTypedFunction: "formatDateDifference", description: """
                                Formats the difference of one date relative to another date. For example, “Yesterday” or “2 weeks ago”.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "getUserDetails": Action<GetUserDetailsParameter>(name: "Get User Details", identifier: "com.sindresorhus.Actions.GetUserDetailsIntent", correctTypedFunction: "getUserDetails", description: """
                                Gets details about the current user. For example, username, name, language, idle time, etc.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "isAudioPlaying": Action<Actions_IsAudioPlayingParameter>(name: "Is Audio Playing (iOS-only)", identifier: "com.sindresorhus.Actions.IsAudioPlayingIntent", correctTypedFunction: "isAudioPlaying", description: """
                                Returns whether there is audio playing on the device.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "randomBoolean": Action<RandomBooleanParameter>(name: "Random Boolean", identifier: "com.sindresorhus.Actions.RandomBooleanIntent", correctTypedFunction: "randomBoolean", description: """
                                Returns a random boolean. Think of it as a random "Yes" or "No" answer.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "hapticFeedback": Action<Actions_HapticFeedbackParameter>(name: "Haptic Feedback (iOS-only)", identifier: "com.sindresorhus.Actions.HapticFeedbackIntent", correctTypedFunction: "hapticFeedback", description: """
                                Generate haptic feedback (vibrate). Not supported on iPad. Requires iPhone 8 or later. The action has to momentarily open the main app as haptic feedback can only be generated from the app.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "createURL": Action<CreateURLParameter>(name: "Create URL", identifier: "com.sindresorhus.Actions.CreateURLIntent", correctTypedFunction: "createURL", description: """
                                Creates a URL from components.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "randomText": Action<RandomTextParameter>(name: "Random Text", identifier: "com.sindresorhus.Actions.RandomTextIntent", correctTypedFunction: "randomText", description: """
                                Returns random text of the given length. This can be useful as a placeholder, token, etc. If you specify a "seed", the generated text will always be the same if the seed is the same.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "removeEmptyLines": Action<RemoveEmptyLinesParameter>(name: "Remove Empty Lines", identifier: "com.sindresorhus.Actions.RemoveEmptyLinesIntent", correctTypedFunction: "removeEmptyLines", description: """
                                Removes empty and whitespace-only lines from the input text.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "removeDuplicateLines": Action<RemoveDuplicateLinesParameter>(name: "Remove Duplicate Lines", identifier: "com.sindresorhus.Actions.RemoveDuplicateLinesIntent", correctTypedFunction: "removeDuplicateLines", description: """
                                Removes duplicate lines from the input text. Empty or whitespace-only lines are not considered duplicates.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "truncateList": Action<TruncateListParameter>(name: "Truncate List", identifier: "com.sindresorhus.Actions.TruncateListIntent", correctTypedFunction: "truncateList", description: """
                                Truncates the input list to the given limit by removing items from the end. Even though the description says this action accepts input of type "Files", it accepts any type.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "sendFeedback": Action<SendFeedbackParameter>(name: "Send Feedback", identifier: "com.sindresorhus.Actions.SendFeedbackIntent", correctTypedFunction: "sendFeedback", description: """
                                Lets you send feedback, action ideas, bug reports, etc, directly to the developer of the Actions app. You can also email me at sindresorhus@gmail.com if you prefer that.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "getFileIcon": Action<GetFileIconParameter>(name: "Get File Icon (macOS-only)", identifier: "com.sindresorhus.Actions.GetFileIconIntent", correctTypedFunction: "getFileIcon", description: """
                                Gets the icon for the input files.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "randomEmoji": Action<RandomEmojiParameter>(name: "Random Emoticon", identifier: "com.sindresorhus.Actions.RandomEmojiIntent", correctTypedFunction: "randomEmoji", description: """
                                Returns a random emoticon (also known as smiley).
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "generateUUID": Action<Actions_GenerateUUIDParameter>(name: "Generate UUID", identifier: "com.sindresorhus.Actions.GenerateUUIDIntent", correctTypedFunction: "generateUUID", description: """
                                Generates a universally unique identifier (UUID).
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "sortList": Action<Actions_SortListParameter>(name: "Sort List", identifier: "com.sindresorhus.Actions.SortListIntent", correctTypedFunction: "sortList", description: """
                                Sorts the input list. Supports a list of text and numbers.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "spellOutNumber": Action<SpellOutNumberParameter>(name: "Spell Out Number", identifier: "com.sindresorhus.Actions.SpellOutNumberIntent", correctTypedFunction: "spellOutNumber", description: """
                                Spells out the input number. For example, "one thousand". If a ActionsLocale is not specified, the system ActionsLocale is used.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "sampleColor": Action<SampleColorParameter>(name: "Sample Color from Screen (macOS-only)", identifier: "com.sindresorhus.Actions.SampleColorIntent", correctTypedFunction: "sampleColor", description: """
                                Lets you pick a color from the screen. Returns the color in Hex format.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "filterList": Action<Actions_FilterListParameter>(name: "Filter List", identifier: "com.sindresorhus.Actions.FilterListIntent", correctTypedFunction: "filterList", description: """
                                Choose which items to keep or discard in the input list based on a condition. Supports a list of text and numbers.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "getBatteryState": Action<GetBatteryStateParameter>(name: "Get Battery State", identifier: "com.sindresorhus.Actions.GetBatteryStateIntent", correctTypedFunction: "getBatteryState", description: """
                                Gets whether the device's battery is unplugged, charging, or full.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "transformTextWithJavaScript": Action<TransformTextWithJavaScriptParameter>(name: "Transform Text with JavaScript", identifier: "com.sindresorhus.Actions.TransformTextWithJavaScriptIntent", correctTypedFunction: "transformTextWithJavaScript", description: """
                                Transforms the input text with the given JavaScript code. The input text is available in a global variable named $text. You are expected to return a string. The code must be synchronous. The code is excuted with JavaScriptCore (same as used in Safari), not JXA.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "getTitleOfURL": Action<GetTitleOfURLParameter>(name: "Get Title of URL", identifier: "com.sindresorhus.Actions.GetTitleOfURLIntent", correctTypedFunction: "getTitleOfURL", description: """
                                Gets the title of the website at the input URL.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "getRunningApps": Action<GetRunningAppsParameter>(name: "Get Running Apps (macOS-only)", identifier: "com.sindresorhus.Actions.GetRunningAppsIntent", correctTypedFunction: "getRunningApps", description: """
                                Returns the currently running apps, including various metadata about them. Use the built-in "Show Result" action to inspect the individual properties.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "unixTimeToDate": Action<UnixTimeToDateParameter>(name: "Unix Time to Date", identifier: "com.sindresorhus.Actions.UnixTimeToDateIntent", correctTypedFunction: "unixTimeToDate", description: """
                                Gets the date for the input Unix time. Unix time (also known as Epoch time) is a system for describing a point in time — the number of seconds that have elapsed since the Unix epoch.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "isLowPowerMode": Action<IsLowPowerModeParameter>(name: "Is Low Power Mode On", identifier: "com.sindresorhus.Actions.IsLowPowerModeIntent", correctTypedFunction: "isLowPowerMode", description: """
                                Returns whether low power mode is enabled on the device.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "formatCurrency": Action<Actions_FormatCurrencyParameter>(name: "Format Currency", identifier: "com.sindresorhus.Actions.FormatCurrencyIntent", correctTypedFunction: "formatCurrency", description: """
                                Formats the input amount as currency. If a currency is not specified, it uses the currency of the system ActionsLocale.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "trimWhitespace": Action<TrimWhitespaceParameter>(name: "Trim Whitespace", identifier: "com.sindresorhus.Actions.TrimWhitespaceIntent", correctTypedFunction: "trimWhitespace", description: """
                                Removes leading & trailing whitespace and newline characters from the input text.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),

    ]
}
