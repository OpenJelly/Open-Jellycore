//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension TranspilerLookupTables {
    static var ShortcutsFunctions: [String : AnyAction] = [
  "subscribeToPodcast": Action<SubscribeToPodcastParameter>(name: "Subscribe to Podcast", identifier: "is.workflow.actions.podcasts.subscribe", correctTypedFunction: "subscribeToPodcast", description: """
                                Subscribes to the Podcast at the given feed url in Apple Podcasts.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "changeCase": Action<ChangeCaseParameter>(name: "Change Text Case", identifier: "is.workflow.actions.text.changecase", correctTypedFunction: "changeCase", description: """
                                Changes the case of text.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "statistic": Action<StatisticParameter>(name: "Calculate Statistic", identifier: "is.workflow.actions.statistics", correctTypedFunction: "statistic", description: """
                                Calculates a statistic.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "text": Action<TextParameter>(name: "Text", identifier: "is.workflow.actions.gettext", correctTypedFunction: "text", description: """
                                Declares text. Basically just a string.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "exit": Action<ExitParameter>(name: "Exit Shortcut", identifier: "is.workflow.actions.exit", correctTypedFunction: "exit", description: """
                                Exits the shortcut. This works like a return function basically. You can return a value if you place a variable in the parameters.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "showWebPage": Action<ShowWebPageParameter>(name: "Show Webpage", identifier: "is.workflow.actions.showwebpage", correctTypedFunction: "showWebPage", description: """
                                Shows a webpage at the given URLS.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "quitApp": Action<QuitAppParameter>(name: "Quit App", identifier: "is.workflow.actions.quit.app", correctTypedFunction: "quitApp", description: """
                                Quit's the provided app
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "runSSH": Action<RunSSHParameter>(name: "Run Script Over SSH", identifier: "is.workflow.actions.runsshscript", correctTypedFunction: "runSSH", description: """
                                Runs the given script over an SSH connection.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "takeScreenshot": Action<TakeScreenshotParameter>(name: "Take a Screenshot", identifier: "is.workflow.actions.takescreenshot", correctTypedFunction: "takeScreenshot", description: """
                                Takes a screenshot of the devices current screen.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "createNote": Action<CreateNoteParameter>(name: "Create Note", identifier: "com.apple.mobilenotes.SharingExtension", correctTypedFunction: "createNote", description: """
                                Creates a note with the given input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "eventDetail": Action<EventDetailParameter>(name: "Get Event Detail", identifier: "is.workflow.actions.properties.calendarevents", correctTypedFunction: "eventDetail", description: """
                                Gets a detail about the given event.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getHeaders": Action<GetHeadersParameter>(name: "Get URL Headers", identifier: "is.workflow.actions.url.getheaders", correctTypedFunction: "getHeaders", description: """
                                Retrieves the headers at a certain URL.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "createFolder": Action<CreateFolderParameter>(name: "Create Folder", identifier: "is.workflow.actions.file.createfolder", correctTypedFunction: "createFolder", description: """
                                Create folder at a path.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "revealFile": Action<RevealFileParameter>(name: "Reveal File in Finder", identifier: "is.workflow.actions.file.reveal", correctTypedFunction: "revealFile", description: """
                                Reveals the given file in finder.
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "removeReminders": Action<RemoveRemindersParameter>(name: "Remove Reminders", identifier: "is.workflow.actions.removereminders", correctTypedFunction: "removeReminders", description: """
                                Removes the given reminders.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "continueInShortcuts": Action<ContinueInShortcutsParameter>(name: "Continue In Shortcuts", identifier: "is.workflow.actions.handoff", correctTypedFunction: "continueInShortcuts", description: """
                                Makes the shortcut continue in the Shortcuts app.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "appendNote": Action<AppendNoteParameter>(name: "Append Note", identifier: "is.workflow.actions.appendnote", correctTypedFunction: "appendNote", description: """
                                Appends text to the end of a note.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "selectSong": Action<SelectSongParameter>(name: "Select Song From Apple Music", identifier: "is.workflow.actions.exportsong", correctTypedFunction: "selectSong", description: """
                                Allows you to select a song from Apple Music.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getPodcasts": Action<GetPodcastsParameter>(name: "Get Podcasts", identifier: "is.workflow.actions.getpodcastsfromlibrary", correctTypedFunction: "getPodcasts", description: """
                                Retrieves all the podcasts in your library.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "makeArchive": Action<MakeArchiveParameter>(name: "Make Archive", identifier: "is.workflow.actions.makezip", correctTypedFunction: "makeArchive", description: """
                                Makes an archive of the given file.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getTextFrom": Action<GetTextFromParameter>(name: "Get Text From Input", identifier: "is.workflow.actions.detect.text", correctTypedFunction: "getTextFrom", description: """
                                Gets the text from the given input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "logWorkout": Action<LogWorkoutParameter>(name: "Log Workout", identifier: "is.workflow.actions.health.workout.log", correctTypedFunction: "logWorkout", description: """
                                Logs a workout to the health app.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "filterAttendees": Action<FilterAttendeesParameter>(name: "Filter Attendees", identifier: "is.workflow.actions.filter.eventattendees", correctTypedFunction: "filterAttendees", description: """
                                Filters the given Attendees. Attendees are people attending an event.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "count": Action<CountParameter>(name: "Count", identifier: "is.workflow.actions.count", correctTypedFunction: "count", description: """
                                Counts different things within the given input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "quitAllApps": Action<QuitAllAppsParameter>(name: "Quit All Apps", identifier: "is.workflow.actions.quit.app", correctTypedFunction: "quitAllApps", description: """
                                Quit's all the apps currently open. It will not quit any apps put in the exceptions array.
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    ActionPreset(path: "WFQuitAppMode", value: "All Apps"),

                                ]),
  "markdownFromRich": Action<MarkdownFromRichParameter>(name: "Make Markdown From Rich Text", identifier: "is.workflow.actions.getmarkdownfromrichtext", correctTypedFunction: "markdownFromRich", description: """
                                Makes markdown from the given rich text.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "richTextFromMarkdown": Action<RichTextFromMarkdownParameter>(name: "Make Rich Text From Markdown", identifier: "is.workflow.actions.getrichtextfrommarkdown", correctTypedFunction: "richTextFromMarkdown", description: """
                                Makes rich text from Markdown.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getLocation": Action<GetLocationParameter>(name: "Get Location", identifier: "is.workflow.actions.getcurrentlocation", correctTypedFunction: "getLocation", description: """
                                Gets the devices current location.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "matchText": Action<MatchTextParameter>(name: "Match Text", identifier: "is.workflow.actions.text.match", correctTypedFunction: "matchText", description: """
                                Matches text in the input based on regex.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "productDetail": Action<ProductDetailParameter>(name: "Get Product Detail", identifier: "is.workflow.actions.properties.itunesstore", correctTypedFunction: "productDetail", description: """
                                Gets a detail about the given product.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "runShellScript": Action<RunShellScriptParameter>(name: "Run Shell Script", identifier: "is.workflow.actions.runshellscript", correctTypedFunction: "runShellScript", description: """
                                Runs the given shell script
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "showReminderList": Action<ShowReminderListParameter>(name: "Show Reminders List", identifier: "is.workflow.actions.reminders.showlist", correctTypedFunction: "showReminderList", description: """
                                Shows the given reminder list.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "valueFor": Action<ValueForParameter>(name: "Get Value For Key", identifier: "is.workflow.actions.getvalueforkey", correctTypedFunction: "valueFor", description: """
                                Get's the value for a certain key in a dictionary.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "WFGetDictionaryValueType", value: "Value"),

                                ]),
  "addToReadingList": Action<AddToReadingListParameter>(name: "Add to Reading List", identifier: "is.workflow.actions.readinglist", correctTypedFunction: "addToReadingList", description: """
                                Adds a URL to your reading list.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "encode": Action<EncodeParameter>(name: "Encode Base64", identifier: "is.workflow.actions.base64encode", correctTypedFunction: "encode", description: """
                                Encodes the given input into base64 without line breaks.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "WFBase64LineBreakMode", value: "None"),
ActionPreset(path: "WFEncodeMode", value: "Encode"),

                                ]),
  "getClass": Action<GetClassParameter>(name: "Get Object of Class", identifier: "is.workflow.actions.getclassaction", correctTypedFunction: "getClass", description: """
                                Gets an object with the defined class.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getCurrentConditions": Action<GetCurrentConditionsParameter>(name: "Get Current Conditions", identifier: "is.workflow.actions.weather.currentconditions", correctTypedFunction: "getCurrentConditions", description: """
                                Gets the current weather conditions.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "pageDetail": Action<PageDetailParameter>(name: "Get Page Detail", identifier: "is.workflow.actions.properties.safariwebpage", correctTypedFunction: "pageDetail", description: """
                                Gets a detail about the given Apple Pages Document.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "removeFromAlbum": Action<RemoveFromAlbumParameter>(name: "Remove From Album", identifier: "is.workflow.actions.removefromalbum", correctTypedFunction: "removeFromAlbum", description: """
                                Removes an image from an album.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "shortcutDetail": Action<ShortcutDetailParameter>(name: "Get Shortcut Details", identifier: "is.workflow.actions.properties.workflow", correctTypedFunction: "shortcutDetail", description: """
                                Gets a detail about a Shortcut.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "startWorkout": Action<StartWorkoutParameter>(name: "Start Workout", identifier: "is.workflow.actions.workout.start", correctTypedFunction: "startWorkout", description: """
                                Starts a workout. The value parameter is the amount of whatever unit you place. For example 200 cal, 10 min, or 1 hr
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "hideApp": Action<HideAppParameter>(name: "Hide App", identifier: "is.workflow.actions.hide.app", correctTypedFunction: "hideApp", description: """
                                Hides the given app.
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    ActionPreset(path: "WFHideAppMode", value: "App"),

                                ]),
  "wifiDetails": Action<WifiDetailsParameter>(name: "Get Wi-Fi Details", identifier: "is.workflow.actions.getwifi", correctTypedFunction: "wifiDetails", description: """
                                Gets a detail about the devices WiFi.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "WFNetworkDetailsNetwork", value: "Wi-Fi"),

                                ]),
  "importAudioFiles": Action<ImportAudioFilesParameter>(name: "Import Audio Files", identifier: "is.workflow.actions.importaudiofiles", correctTypedFunction: "importAudioFiles", description: """
                                Imports the given audio files into the Music app.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "extractArchive": Action<ExtractArchiveParameter>(name: "Extract Archive", identifier: "is.workflow.actions.unzip", correctTypedFunction: "extractArchive", description: """
                                Extracts the given archive.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getNumbersFrom": Action<GetNumbersFromParameter>(name: "Get Numbers From Input", identifier: "is.workflow.actions.detect.number", correctTypedFunction: "getNumbersFrom", description: """
                                Detects the numbers in the given input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "takePhoto": Action<TakePhotoParameter>(name: "Take Photo", identifier: "is.workflow.actions.takephoto", correctTypedFunction: "takePhoto", description: """
                                Takes a photo.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "trimVideo": Action<TrimVideoParameter>(name: "Trim Video", identifier: "is.workflow.actions.trimvideo", correctTypedFunction: "trimVideo", description: """
                                Trims a video.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "setCellular": Action<SetCellularParameter>(name: "Set Cellular", identifier: "is.workflow.actions.cellulardata.set", correctTypedFunction: "setCellular", description: """
                                Sets the state of the devices cellular connection.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getFrames": Action<GetFramesParameter>(name: "Get Frames", identifier: "is.workflow.actions.getframesfromimage", correctTypedFunction: "getFrames", description: """
                                Get's all the frames from the given media.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "removeEvents": Action<RemoveEventsParameter>(name: "Remove Events", identifier: "is.workflow.actions.removeevents", correctTypedFunction: "removeEvents", description: """
                                Removes the given events from the calendar.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getPodcastEpisodes": Action<GetPodcastEpisodesParameter>(name: "Get Podcast Episodes", identifier: "is.workflow.actions.getepisodesforpodcast", correctTypedFunction: "getPodcastEpisodes", description: """
                                Retrieves the episodes from a podcast.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "appearanceDetail": Action<AppearanceDetailParameter>(name: "Get Appearance Detail", identifier: "is.workflow.actions.properties.appearance", correctTypedFunction: "appearanceDetail", description: """
                                Gets a detail about the given device Appearance.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "appDetail": Action<AppDetailParameter>(name: "Get App Detail", identifier: "is.workflow.actions.properties.appstore", correctTypedFunction: "appDetail", description: """
                                Gets a detail about the given app.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getArticle": Action<GetArticleParameter>(name: "Get Article", identifier: "is.workflow.actions.getarticle", correctTypedFunction: "getArticle", description: """
                                Retrieves an article using safari reader.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "scanQR": Action<ScanQRParameter>(name: "Scan QR Code", identifier: "is.workflow.actions.scanbarcode", correctTypedFunction: "scanQR", description: """
                                Scans a QR code and returns the output.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getLastVideo": Action<GetLastVideoParameter>(name: "Get Last Video", identifier: "is.workflow.actions.getlastvideo", correctTypedFunction: "getLastVideo", description: """
                                Retrieves the last n videos you recorded.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getName": Action<GetNameParameter>(name: "Get Name", identifier: "is.workflow.actions.getitemname", correctTypedFunction: "getName", description: """
                                Get's the name of the given input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "call": Action<CallParameter>(name: "Call", identifier: "com.apple.mobilephone.call", correctTypedFunction: "call", description: """
                                Calls the given contact.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "math": Action<MathParameter>(name: "Math", identifier: "is.workflow.actions.math", correctTypedFunction: "math", description: """
                                Solves a math equation. You can use +, -, ×, ÷, and … as operations. When using … you can apply a scientific operation type.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "connectToServers": Action<ConnectToServersParameter>(name: "Connect To Servers", identifier: "is.workflow.actions.connecttoservers", correctTypedFunction: "connectToServers", description: """
                                Connects to servers at the given URLs.
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    ActionPreset(path: "Show-WFInput", value: "true"),

                                ]),
  "getType": Action<GetTypeParameter>(name: "Get Type", identifier: "is.workflow.actions.getitemtype", correctTypedFunction: "getType", description: """
                                Get's the type of the given input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "correctSpelling": Action<CorrectSpellingParameter>(name: "Correct Spelling", identifier: "is.workflow.actions.correctspelling", correctTypedFunction: "correctSpelling", description: """
                                Corrects the spelling of a word or sentence. Words can be placed in an array.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "filterReminders": Action<FilterRemindersParameter>(name: "Filter Reminders", identifier: "is.workflow.actions.filter.reminders", correctTypedFunction: "filterReminders", description: """
                                Filters the given reminders. Placing All Reminders in the input will allow you to filter all of your reminders.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "wait": Action<WaitParameter>(name: "Wait", identifier: "is.workflow.actions.delay", correctTypedFunction: "wait", description: """
                                Waits a specified amount of seconds.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "addFrameToGIF": Action<AddFrameToGIFParameter>(name: "Add Frame To GIF", identifier: "is.workflow.actions.addframetogif", correctTypedFunction: "addFrameToGIF", description: """
                                Adds the given photo to a GIF as a frame.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "keysFrom": Action<KeysFromParameter>(name: "Get All Keys from Dictionary", identifier: "is.workflow.actions.getvalueforkey", correctTypedFunction: "keysFrom", description: """
                                Get all of the keys from a dictionary.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "WFGetDictionaryValueType", value: "All Keys"),

                                ]),
  "getEmailFrom": Action<GetEmailFromParameter>(name: "Get Email From Input", identifier: "is.workflow.actions.detect.emailaddress", correctTypedFunction: "getEmailFrom", description: """
                                Gets emails from the given input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getLastBurst": Action<GetLastBurstParameter>(name: "Get Last Bursts", identifier: "is.workflow.actions.getlatestbursts", correctTypedFunction: "getLastBurst", description: """
                                Retrieves the last n bursts you took.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "adjustDate": Action<AdjustDateParameter>(name: "Adjust Date", identifier: "is.workflow.actions.adjustdate", correctTypedFunction: "adjustDate", description: """
                                Adjusts the given date by adding or subtracting the given duration. If you use any get operation you do not need a duration.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getLastImport": Action<GetLastImportParameter>(name: "Get Last Photo Import", identifier: "is.workflow.actions.getlatestphotoimport", correctTypedFunction: "getLastImport", description: """
                                Retrieves the last photo you imported.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "printDocument": Action<PrintDocumentParameter>(name: "Print Document", identifier: "is.workflow.actions.print", correctTypedFunction: "printDocument", description: """
                                Prints the input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "setAppearance": Action<SetAppearanceParameter>(name: "Set Device Appearance", identifier: "is.workflow.actions.appearance", correctTypedFunction: "setAppearance", description: """
                                Sets the devices appearance to the given style.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "operation", value: "set"),

                                ]),
  "selectPhone": Action<SelectPhoneParameter>(name: "Select Phone Number", identifier: "is.workflow.actions.selectphone", correctTypedFunction: "selectPhone", description: """
                                Allows you to select a phone number.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "playPodcast": Action<PlayPodcastParameter>(name: "Play Podcast", identifier: "is.workflow.actions.playpodcast", correctTypedFunction: "playPodcast", description: """
                                Subscribes to the Podcast at the given feed url in Apple Podcasts.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "skipBack": Action<SkipBackParameter>(name: "Skip Backward", identifier: "is.workflow.actions.skipback", correctTypedFunction: "skipBack", description: """
                                Skips backwards in the current media queue.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getFolderContents": Action<GetFolderContentsParameter>(name: "Get Contents of Folder", identifier: "is.workflow.actions.file.getfoldercontents", correctTypedFunction: "getFolderContents", description: """
                                Get's the content of the provided folder.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "splitScreen": Action<SplitScreenParameter>(name: "Split Screen", identifier: "is.workflow.actions.splitscreen", correctTypedFunction: "splitScreen", description: """
                                Split screen two apps
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "url": Action<UrlParameter>(name: "URL", identifier: "is.workflow.actions.url", correctTypedFunction: "url", description: """
                                Just a URL.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getCurrentSong": Action<GetCurrentSongParameter>(name: "Get Current Song", identifier: "is.workflow.actions.getcurrentsong", correctTypedFunction: "getCurrentSong", description: """
                                Retrieves the current song playing.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "setAirplaneMode": Action<SetAirplaneModeParameter>(name: "Set Airplane Mode", identifier: "is.workflow.actions.airplanemode.set", correctTypedFunction: "setAirplaneMode", description: """
                                Sets the devices airplane mode.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "showNote": Action<ShowNoteParameter>(name: "Show Note", identifier: "is.workflow.actions.shownote", correctTypedFunction: "showNote", description: """
                                Shows the provided note.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "replaceText": Action<ReplaceTextParameter>(name: "Replace Text", identifier: "is.workflow.actions.text.replace", correctTypedFunction: "replaceText", description: """
                                Replaces text based on the parameters.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "showDefinition": Action<ShowDefinitionParameter>(name: "Show Definition", identifier: "is.workflow.actions.showdefinition", correctTypedFunction: "showDefinition", description: """
                                Gets the definition of a word.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "setBluetooth": Action<SetBluetoothParameter>(name: "Set Bluetooth", identifier: "is.workflow.actions.bluetooth.set", correctTypedFunction: "setBluetooth", description: """
                                Sets the devices bluetooth to the given boolean.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "dictionary": Action<DictionaryParameter>(name: "Dictionary", identifier: "is.workflow.actions.dictionary", correctTypedFunction: "dictionary", description: """
                                Creates a dictionary based on the given JSON. JSON can be replaced with a dictionary from the dictionary builder.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "deleteFile": Action<DeleteFileParameter>(name: "Delete File", identifier: "is.workflow.actions.file.delete", correctTypedFunction: "deleteFile", description: """
                                Deletes the provided file.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "moveFile": Action<MoveFileParameter>(name: "Move File", identifier: "is.workflow.actions.file.move", correctTypedFunction: "moveFile", description: """
                                Moves the given file to a given folder
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "setVolume": Action<SetVolumeParameter>(name: "Set Volume", identifier: "is.workflow.actions.setvolume", correctTypedFunction: "setVolume", description: """
                                Sets the devices volume.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "setValue": Action<SetValueParameter>(name: "Set Dictionary Value", identifier: "is.workflow.actions.setvalueforkey", correctTypedFunction: "setValue", description: """
                                Sets a key's value in a dictionary.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "handoffPlayback": Action<HandoffPlaybackParameter>(name: "Handoff Playback", identifier: "is.workflow.actions.handoffplayback", correctTypedFunction: "handoffPlayback", description: """
                                Hands off Current Audio.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "searchPodcasts": Action<SearchPodcastsParameter>(name: "Search Podcasts", identifier: "is.workflow.actions.searchpodcasts", correctTypedFunction: "searchPodcasts", description: """
                                Search Apple Podcasts based on the given search terms.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getClipboard": Action<GetClipboardParameter>(name: "Get Clipboard", identifier: "is.workflow.actions.getclipboard", correctTypedFunction: "getClipboard", description: """
                                Get's the devices clipboard.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "setWiFi": Action<SetWiFiParameter>(name: "Set WiFi", identifier: "is.workflow.actions.wifi.set", correctTypedFunction: "setWiFi", description: """
                                Sets the state of the devices WiFi connection.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "fileDetail": Action<FileDetailParameter>(name: "Get File Details", identifier: "is.workflow.actions.properties.files", correctTypedFunction: "fileDetail", description: """
                                Retrieves a detail about a file.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "toggleAppearance": Action<ToggleAppearanceParameter>(name: "Toggle Device Appearance", identifier: "is.workflow.actions.appearance", correctTypedFunction: "toggleAppearance", description: """
                                Toggles the devices appearance
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "operation", value: "toggle"),

                                ]),
  "shazamIt": Action<ShazamItParameter>(name: "Shazam It", identifier: "is.workflow.actions.shazamMedia", correctTypedFunction: "shazamIt", description: """
                                Starts a Shazam.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "selectContact": Action<SelectContactParameter>(name: "Select Contact", identifier: "is.workflow.actions.selectcontacts", correctTypedFunction: "selectContact", description: """
                                Allows you to select a contact.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getallalarms": Action<GetallalarmsParameter>(name: "Get All Alarms", identifier: "com.apple.mobiletimer-framework.MobileTimerIntents.MTGetAlarmsIntent", correctTypedFunction: "getallalarms", description: """
                                Retrieves all of your alarms.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "filterContacts": Action<FilterContactsParameter>(name: "Filter Contacts", identifier: "is.workflow.actions.filter.contacts", correctTypedFunction: "filterContacts", description: """
                                Filters the given contacts. Placing All Contacts in the input will allow you to filter all of your contacts.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "round": Action<RoundParameter>(name: "Round Number", identifier: "is.workflow.actions.round", correctTypedFunction: "round", description: """
                                Rounds a number depending on the parameters.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "imageDetail": Action<ImageDetailParameter>(name: "Get Image Detail", identifier: "is.workflow.actions.properties.images", correctTypedFunction: "imageDetail", description: """
                                Gets a detail about the given image.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "shazamDetail": Action<ShazamDetailParameter>(name: "Get Shazam Detail", identifier: "is.workflow.actions.properties.shazam", correctTypedFunction: "shazamDetail", description: """
                                Gets a detail about the given Shazam.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "mountDiskImage": Action<MountDiskImageParameter>(name: "Mount Disk Image", identifier: "is.workflow.actions.mountdiskimage", correctTypedFunction: "mountDiskImage", description: """
                                Mount's the given disk image.
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "appendFile": Action<AppendFileParameter>(name: "Append File", identifier: "is.workflow.actions.file.append", correctTypedFunction: "appendFile", description: """
                                Appends contents to the end of a file.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "WFAppendFileWriteMode", value: "Append"),

                                ]),
  "setFlashlight": Action<SetFlashlightParameter>(name: "Set Flashlight", identifier: "is.workflow.actions.flashlight", correctTypedFunction: "setFlashlight", description: """
                                Sets the flashlight state and brightness.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "findWindows": Action<FindWindowsParameter>(name: "Find Windows", identifier: "is.workflow.actions.filter.windows", correctTypedFunction: "findWindows", description: """
                                Find's any windows with the specified parameters. To filter all windows, use All Windows as the input.
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "htmlFromRichText": Action<HtmlFromRichTextParameter>(name: "Make HTML From Rich Text", identifier: "is.workflow.actions.gethtmlfromrichtext", correctTypedFunction: "htmlFromRichText", description: """
                                Creates an HTML document from the provided Rich Text.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "takeVideo": Action<TakeVideoParameter>(name: "Take Video", identifier: "is.workflow.actions.takevideo", correctTypedFunction: "takeVideo", description: """
                                Takes a video.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "recordAudio": Action<RecordAudioParameter>(name: "Record Audio", identifier: "is.workflow.actions.recordaudio", correctTypedFunction: "recordAudio", description: """
                                Records audio with the given parameters.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "askForInput": Action<AskForInputParameter>(name: "Ask for Input", identifier: "is.workflow.actions.ask", correctTypedFunction: "askForInput", description: """
                                Asks the user for input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "valuesFrom": Action<ValuesFromParameter>(name: "Get All Values from Dictionary", identifier: "is.workflow.actions.getvalueforkey", correctTypedFunction: "valuesFrom", description: """
                                Get all of the values from a dictionary.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "WFGetDictionaryValueType", value: "All Values"),

                                ]),
  "play": Action<PlayParameter>(name: "Play Music", identifier: "is.workflow.actions.pausemusic", correctTypedFunction: "play", description: """
                                Plays or pauses the current music.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "changeWallpaper": Action<ChangeWallpaperParameter>(name: "Change Wallpaper", identifier: "is.workflow.actions.wallpaper.set", correctTypedFunction: "changeWallpaper", description: """
                                Changes the devices wallpaper.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getURL": Action<GetURLParameter>(name: "Get URL", identifier: "is.workflow.actions.safari.geturl", correctTypedFunction: "getURL", description: """
                                Retrieves the current URL you have open in Safari.
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "noteDetail": Action<NoteDetailParameter>(name: "Get Note Details", identifier: "is.workflow.actions.properties.note", correctTypedFunction: "noteDetail", description: """
                                Gets a detail about the note.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getLastScreenshot": Action<GetLastScreenshotParameter>(name: "Get Last Screenshots", identifier: "is.workflow.actions.getlastscreenshot", correctTypedFunction: "getLastScreenshot", description: """
                                Retrieves the last n screenshots you took.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "waitToReturn": Action<WaitToReturnParameter>(name: "Wait to return", identifier: "is.workflow.actions.waittoreturn", correctTypedFunction: "waitToReturn", description: """
                                Waits for you to return back to the app to continue execution.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "musicDetail": Action<MusicDetailParameter>(name: "Get Music Detail", identifier: "is.workflow.actions.properties.music", correctTypedFunction: "musicDetail", description: """
                                Gets a detail about the given song.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "contactDetail": Action<ContactDetailParameter>(name: "Get Contact Detail", identifier: "is.workflow.actions.properties.contacts", correctTypedFunction: "contactDetail", description: """
                                Gets a detail about the given contact.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "filterImages": Action<FilterImagesParameter>(name: "Filter Images", identifier: "is.workflow.actions.filter.images", correctTypedFunction: "filterImages", description: """
                                Filters the given images.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "filterLocations": Action<FilterLocationsParameter>(name: "Filter Locations", identifier: "is.workflow.actions.filter.locations", correctTypedFunction: "filterLocations", description: """
                                Filters the given locations.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "runJavascriptOnWebpage": Action<RunJavascriptOnWebpageParameter>(name: "Run Javascript on Webpage", identifier: "is.workflow.actions.runjavascriptonwebpage", correctTypedFunction: "runJavascriptOnWebpage", description: """
                                Runs the given javascript on a webpage.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "filterMusic": Action<FilterMusicParameter>(name: "Filter Music", identifier: "is.workflow.actions.filter.music", correctTypedFunction: "filterMusic", description: """
                                Filters the given music. Placing All Music in the input will allow you to filter all of your music.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "setMediaDestination": Action<SetMediaDestinationParameter>(name: "Set Media Destination", identifier: "is.workflow.actions.setplaybackdestination", correctTypedFunction: "setMediaDestination", description: """
                                Sets the playback destination of the current media.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getFileOfType": Action<GetFileOfTypeParameter>(name: "Get File Of Type", identifier: "is.workflow.actions.gettypeaction", correctTypedFunction: "getFileOfType", description: """
                                Retrieves a file of the provided type from the given input..
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "stockQuote": Action<StockQuoteParameter>(name: "Stock Quote", identifier: "is.workflow.actions.stocks.quote", correctTypedFunction: "stockQuote", description: """
                                Gets a quote for the provided stock symbol.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getPlaylist": Action<GetPlaylistParameter>(name: "Get Playlist", identifier: "is.workflow.actions.get.playlist", correctTypedFunction: "getPlaylist", description: """
                                Retrieves a playlist.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "overlayImage": Action<OverlayImageParameter>(name: "Overlay Image", identifier: "is.workflow.actions.overlayimageonimage", correctTypedFunction: "overlayImage", description: """
                                Overlays one image onto another image.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "createPDF": Action<CreatePDFParameter>(name: "Create PDF", identifier: "is.workflow.actions.makepdf", correctTypedFunction: "createPDF", description: """
                                Creates a pdf from the provided input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "formatDate": Action<FormatDateParameter>(name: "Format Date", identifier: "is.workflow.actions.format.date", correctTypedFunction: "formatDate", description: """
                                Formats the given date.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "filterNotes": Action<FilterNotesParameter>(name: "Filter Notes", identifier: "is.workflow.actions.filter.notes", correctTypedFunction: "filterNotes", description: """
                                Filters the given notes. Placing All Notes in the input will allow you to filter all of your notes.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "deletePhotos": Action<DeletePhotosParameter>(name: "Delete Photos", identifier: "is.workflow.actions.deletephotos", correctTypedFunction: "deletePhotos", description: """
                                Deletes the given photos.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "file": Action<FileParameter>(name: "File", identifier: "is.workflow.actions.file", correctTypedFunction: "file", description: """
                                Get's a reference to the given file
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "clearUpNext": Action<ClearUpNextParameter>(name: "Clear Up Next", identifier: "is.workflow.actions.clearupnext", correctTypedFunction: "clearUpNext", description: """
                                Clears the up next queue.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "airdrop": Action<AirdropParameter>(name: "Airdrop", identifier: "is.workflow.actions.airdropdocument", correctTypedFunction: "airdrop", description: """
                                Airdrops the input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "javascriptForAutomation": Action<JavascriptForAutomationParameter>(name: "Run Javascript For Automation", identifier: "is.workflow.actions.runjavascriptforautomation", correctTypedFunction: "javascriptForAutomation", description: """
                                Executes a JXA script for Mac Automation.
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "setDND": Action<SetDNDParameter>(name: "Set Do Not Disturb", identifier: "is.workflow.actions.dnd.set", correctTypedFunction: "setDND", description: """
                                Sets the devices Do Not Disturb to the given boolean.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "randomNumber": Action<RandomNumberParameter>(name: "Random Number", identifier: "is.workflow.actions.number.random", correctTypedFunction: "randomNumber", description: """
                                Get's a random number between the provided max and min.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "shareEXT": Action<ShareEXTParameter>(name: "Share With Extensions", identifier: "is.workflow.actions.runextension", correctTypedFunction: "shareEXT", description: """
                                Shares input with extensions.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "podcastDetail": Action<PodcastDetailParameter>(name: "Get Podcast Show Detail", identifier: "is.workflow.actions.properties.podcastshow", correctTypedFunction: "podcastDetail", description: """
                                Gets a detail about the given Podcast show. Checkout Launched it's a super good show.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "stockDetail": Action<StockDetailParameter>(name: "Get Stock Detail", identifier: "is.workflow.actions.properties.stock", correctTypedFunction: "stockDetail", description: """
                                Gets a detail about the given stock.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "convertImageFinder": Action<ConvertImageFinderParameter>(name: "Convert Image - Finder", identifier: "is.workflow.actions.image.convert.finder", correctTypedFunction: "convertImageFinder", description: """
                                Convert an image to another format. This is the same as the convertImage action, however it uses a different UI for macOS
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "imageFromPDF": Action<ImageFromPDFParameter>(name: "Make Image from PDF Page", identifier: "is.workflow.actions.makeimagefrompdfpage", correctTypedFunction: "imageFromPDF", description: """
                                Make an image from a PDF, 
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "showResult": Action<ShowResultParameter>(name: "Show Result", identifier: "is.workflow.actions.showresult", correctTypedFunction: "showResult", description: """
                                Shows the given result.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getParentDirectory": Action<GetParentDirectoryParameter>(name: "Get Parent Directory", identifier: "is.workflow.actions.getparentdirectory", correctTypedFunction: "getParentDirectory", description: """
                                Get's the parent directory of a file
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "addToPlaylist": Action<AddToPlaylistParameter>(name: "Add to Playlist", identifier: "is.workflow.actions.addtoplaylist", correctTypedFunction: "addToPlaylist", description: """
                                Adds the provided music to the provided playlist.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "runAppleScript": Action<RunAppleScriptParameter>(name: "Run Apple Script", identifier: "is.workflow.actions.runapplescript", correctTypedFunction: "runAppleScript", description: """
                                Runs the given Apple Script code. For code to run when the action is executed, you must include it inside
                                on run {input, parameters}
                                    (* Your script goes here *)
                                    return input
                                end run
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "lowPowerMode": Action<LowPowerModeParameter>(name: "Set Low Power Mode", identifier: "is.workflow.actions.lowpowermode.set", correctTypedFunction: "lowPowerMode", description: """
                                Sets the devices low power mode.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "calculate": Action<CalculateParameter>(name: "Calculate Expression", identifier: "is.workflow.actions.calculateexpression", correctTypedFunction: "calculate", description: """
                                Calculates an expression
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getScreenContext": Action<GetScreenContextParameter>(name: "Get Screen Context", identifier: "is.workflow.actions.getonscreencontent", correctTypedFunction: "getScreenContext", description: """
                                Retrieves the current on screen context.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "toggleOrientationLock": Action<ToggleOrientationLockParameter>(name: "Toggle Orientation Lock", identifier: "is.workflow.actions.orientationlock.set", correctTypedFunction: "toggleOrientationLock", description: """
                                Toggles the state of the devices Orientation Lock.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "operation", value: "toggle"),

                                ]),
  "addUpNext": Action<AddUpNextParameter>(name: "Add Music Up Next", identifier: "is.workflow.actions.addmusictoupnext", correctTypedFunction: "addUpNext", description: """
                                Adds the provided music to the up next queue.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "rotateImage": Action<RotateImageParameter>(name: "Rotate Image", identifier: "is.workflow.actions.image.rotate", correctTypedFunction: "rotateImage", description: """
                                Rotates an image a certain degree.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "richTextFromHTML": Action<RichTextFromHTMLParameter>(name: "Make Rich Text From HTML", identifier: "is.workflow.actions.getrichtextfromhtml", correctTypedFunction: "richTextFromHTML", description: """
                                Creates Rich Text from provided HTML.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "saveFileDropbox": Action<SaveFileDropboxParameter>(name: "Save Dropbox File", identifier: "is.workflow.actions.dropbox.savefile", correctTypedFunction: "saveFileDropbox", description: """
                                Save a file to dropbox.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "toggleFlashlight": Action<ToggleFlashlightParameter>(name: "Toggle Flashlight", identifier: "is.workflow.actions.flashlight", correctTypedFunction: "toggleFlashlight", description: """
                                Toggles the flashlight.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "operation", value: "toggle"),

                                ]),
  "toggleLowPowerMode": Action<ToggleLowPowerModeParameter>(name: "Toggle Low Power Mode", identifier: "is.workflow.actions.lowpowermode.set", correctTypedFunction: "toggleLowPowerMode", description: """
                                Toggles low power mode.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "operation", value: "toggle"),

                                ]),
  "getLastPhoto": Action<GetLastPhotoParameter>(name: "Get Last Photo", identifier: "is.workflow.actions.getlastphoto", correctTypedFunction: "getLastPhoto", description: """
                                Retrieves the last n photos in your library. You can optionally include screenshots or not.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "combineImage": Action<CombineImageParameter>(name: "Combine Image", identifier: "is.workflow.actions.image.combine", correctTypedFunction: "combineImage", description: """
                                Combines an image.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "addNewCalendar": Action<AddNewCalendarParameter>(name: "Add New Calendar", identifier: "is.workflow.actions.addnewcalendar", correctTypedFunction: "addNewCalendar", description: """
                                Create's a new calendar with the given name.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "timer": Action<TimerParameter>(name: "Start Timer", identifier: "is.workflow.actions.timer.start", correctTypedFunction: "timer", description: """
                                Starts a timer for the given time.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "reminderDetail": Action<ReminderDetailParameter>(name: "Get Reminder Detail", identifier: "is.workflow.actions.properties.reminders", correctTypedFunction: "reminderDetail", description: """
                                Gets a detail about the given reminder.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "speakText": Action<SpeakTextParameter>(name: "Speak Text", identifier: "is.workflow.actions.speaktext", correctTypedFunction: "speakText", description: """
                                Speaks the given text.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getMatchGroup": Action<GetMatchGroupParameter>(name: "Get Match Group", identifier: "is.workflow.actions.text.match.getgroup", correctTypedFunction: "getMatchGroup", description: """
                                Gets the a certain group in a regex match.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "seek": Action<SeekParameter>(name: "Seek Media", identifier: "is.workflow.actions.seek", correctTypedFunction: "seek", description: """
                                Seeks in the current media.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "setOrientationLock": Action<SetOrientationLockParameter>(name: "Set Orientation Lock", identifier: "is.workflow.actions.orientationlock.set", correctTypedFunction: "setOrientationLock", description: """
                                Sets the state of the devices Orientation Lock.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "operation", value: "set"),

                                ]),
  "xCallbackURL": Action<XCallbackURLParameter>(name: "Open X-Callback URL", identifier: "is.workflow.actions.openxcallbackurl", correctTypedFunction: "xCallbackURL", description: """
                                Run an x-callback URL.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "filterArticles": Action<FilterArticlesParameter>(name: "Filter Articles", identifier: "is.workflow.actions.filter.articles", correctTypedFunction: "filterArticles", description: """
                                Filters the given articles.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getTextFromPDF": Action<GetTextFromPDFParameter>(name: "Get Text From PDF", identifier: "is.workflow.actions.gettextfrompdf", correctTypedFunction: "getTextFromPDF", description: """
                                Retrieves the text from a pdf.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "filterPhotos": Action<FilterPhotosParameter>(name: "Filter Photos", identifier: "is.workflow.actions.filter.photos", correctTypedFunction: "filterPhotos", description: """
                                Filters the given notes. Placing All Photos in the input will allow you to filter all of your photos.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "playMusic": Action<PlayMusicParameter>(name: "Play Music", identifier: "is.workflow.actions.playmusic", correctTypedFunction: "playMusic", description: """
                                Start's playing the provided music.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "formatSize": Action<FormatSizeParameter>(name: "Format Size", identifier: "is.workflow.actions.format.filesize", correctTypedFunction: "formatSize", description: """
                                Formats the size of a file.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "markup": Action<MarkupParameter>(name: "Markup", identifier: "is.workflow.actions.avairyeditphoto", correctTypedFunction: "markup", description: """
                                Prepends contents to the file.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getSelectedFiles": Action<GetSelectedFilesParameter>(name: "Get Selected Files", identifier: "is.workflow.actions.finder.getselectedfiles", correctTypedFunction: "getSelectedFiles", description: """
                                Get the currently selected files in the finder.
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "sendNotification": Action<SendNotificationParameter>(name: "Send Notification", identifier: "is.workflow.actions.notification", correctTypedFunction: "sendNotification", description: """
                                Sends the user a notifcation.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getUpcomingReminders": Action<GetUpcomingRemindersParameter>(name: "Get Upcoming Reminders", identifier: "is.workflow.actions.getupcomingreminders", correctTypedFunction: "getUpcomingReminders", description: """
                                Retrieves the upcoming reminders from the given list. All Lists will get reminders from all lists.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "saveToCameraRoll": Action<SaveToCameraRollParameter>(name: "Save to Camera Roll", identifier: "is.workflow.actions.savetocameraroll", correctTypedFunction: "saveToCameraRoll", description: """
                                Saves the given image to the camera roll.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "maskImage": Action<MaskImageParameter>(name: "Mask Image", identifier: "is.workflow.actions.image.mask", correctTypedFunction: "maskImage", description: """
                                Masks an image.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getIP": Action<GetIPParameter>(name: "Get IP Address", identifier: "is.workflow.actions.getipaddress", correctTypedFunction: "getIP", description: """
                                Gets the devices IP address.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "movenotestofolder": Action<MovenotestofolderParameter>(name: "Move Notes To Folder", identifier: "com.apple.mobilenotes.MoveNotesToFolderLinkAction", correctTypedFunction: "movenotestofolder", description: """
                                Outputs the given input as the shortcuts result. If there is no where too output, the result behavior is used to determine what should be done with the result.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "vibrate": Action<VibrateParameter>(name: "Vibrate Device", identifier: "is.workflow.actions.vibrate", correctTypedFunction: "vibrate", description: """
                                Vibrates the device.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "combineText": Action<CombineTextParameter>(name: "Combine Text", identifier: "is.workflow.actions.text.combine", correctTypedFunction: "combineText", description: """
                                Combines the given text. Text can be given in an array.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "Show-text", value: "true"),

                                ]),
  "siriDonation": Action<SiriDonationParameter>(name: "Siri Donation", identifier: "is.workflow.actions.sirikit.donation.handle", correctTypedFunction: "siriDonation", description: """
                                This is just a blank action that does not do anything.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "searchAppStore": Action<SearchAppStoreParameter>(name: "Search App Store", identifier: "is.workflow.actions.searappstore", correctTypedFunction: "searchAppStore", description: """
                                Searches the app store using the given parameters.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "runShortcut": Action<RunShortcutParameter>(name: "Run Shortcut", identifier: "is.workflow.actions.runworkflow", correctTypedFunction: "runShortcut", description: """
                                Runs the given shortcut.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "translateText": Action<TranslateTextParameter>(name: "Translate Text", identifier: "is.workflow.actions.text.translate", correctTypedFunction: "translateText", description: """
                                Translates the given text from one language to another.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "userActivity": Action<UserActivityParameter>(name: "User Activity", identifier: "is.workflow.actions.useractivity.open", correctTypedFunction: "userActivity", description: """
                                This is just a blank action that does not do anything.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getFileLink": Action<GetFileLinkParameter>(name: "Get File Link", identifier: "is.workflow.actions.file.getlink", correctTypedFunction: "getFileLink", description: """
                                Gets the iCloud link to a certain file.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "showInStore": Action<ShowInStoreParameter>(name: "Show in Store", identifier: "is.workflow.actions.showinstore", correctTypedFunction: "showInStore", description: """
                                Shows the provided product in the store.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "openApp": Action<OpenAppParameter>(name: "Open App", identifier: "is.workflow.actions.openapp", correctTypedFunction: "openApp", description: """
                                Opens an app on the device.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "toggleAirplaneMode": Action<ToggleAirplaneModeParameter>(name: "Toggle Airplane Mode", identifier: "is.workflow.actions.airplanemode.set", correctTypedFunction: "toggleAirplaneMode", description: """
                                Toggles airplane mode.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "operation", value: "toggle"),

                                ]),
  "watchMeDo": Action<WatchMeDoParameter>(name: "Watch Me Do", identifier: "is.workflow.actions.watchmedo", correctTypedFunction: "watchMeDo", description: """
                                A placeholder action for automators Watch Me Do action.
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "decode": Action<DecodeParameter>(name: "Decode Base64", identifier: "is.workflow.actions.base64encode", correctTypedFunction: "decode", description: """
                                Decodes the given base64 input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "WFEncodeMode", value: "Decode"),

                                ]),
  "convertImage": Action<ConvertImageParameter>(name: "Convert Image", identifier: "is.workflow.actions.image.convert", correctTypedFunction: "convertImage", description: """
                                Converts an image to a new format.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "sendMessage": Action<SendMessageParameter>(name: "Send Message", identifier: "is.workflow.actions.getepisodesforpodcast", correctTypedFunction: "sendMessage", description: """
                                Sends a message to a recipient.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "facetime": Action<FacetimeParameter>(name: "Facetime", identifier: "com.apple.facetime.facetime", correctTypedFunction: "facetime", description: """
                                Facetimes the given contact.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "locationDetail": Action<LocationDetailParameter>(name: "Get Location Detail", identifier: "is.workflow.actions.properties.locations", correctTypedFunction: "locationDetail", description: """
                                Gets a detail about the given location.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getForecast": Action<GetForecastParameter>(name: "Get Forecast", identifier: "is.workflow.actions.weather.forecast", correctTypedFunction: "getForecast", description: """
                                Retrieves the forecast in your local area.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "encodeMedia": Action<EncodeMediaParameter>(name: "Encode Media", identifier: "is.workflow.actions.encodemedia", correctTypedFunction: "encodeMedia", description: """
                                Encodes the given media into a video.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "WFMediaAudioOnly", value: "false"),

                                ]),
  "articleDetail": Action<ArticleDetailParameter>(name: "Get Article Detail", identifier: "is.workflow.actions.properties.articles", correctTypedFunction: "articleDetail", description: """
                                Gets a detail about the given article.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "setBrightness": Action<SetBrightnessParameter>(name: "Set Brightness", identifier: "is.workflow.actions.setbrightness", correctTypedFunction: "setBrightness", description: """
                                Sets the devices bluetooth to the given double.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "emojiName": Action<EmojiNameParameter>(name: "Emoji Name", identifier: "is.workflow.actions.getnameofemoji", correctTypedFunction: "emojiName", description: """
                                Retrieves the name of the Emoji.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "choose": Action<ChooseParameter>(name: "Choose From List", identifier: "is.workflow.actions.choosefromlist", correctTypedFunction: "choose", description: """
                                Allows you to choose an item from the given list.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "cropImage": Action<CropImageParameter>(name: "Crop Image", identifier: "is.workflow.actions.image.crop", correctTypedFunction: "cropImage", description: """
                                Crops an Image to the specified parameters.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "saveFile": Action<SaveFileParameter>(name: "Save File", identifier: "is.workflow.actions.documentpicker.save", correctTypedFunction: "saveFile", description: """
                                Saves a file to a certain path. Can also show a save prompt if ask is true.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "createAlbum": Action<CreateAlbumParameter>(name: "Create Photo Album", identifier: "is.workflow.actions.photos.createalbum", correctTypedFunction: "createAlbum", description: """
                                Create's a new photo album with the given photos and names.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "selectFile": Action<SelectFileParameter>(name: "Select File", identifier: "is.workflow.actions.file.select", correctTypedFunction: "selectFile", description: """
                                Select a file or folder from the system.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "conditionDetail": Action<ConditionDetailParameter>(name: "Get Condition Details", identifier: "is.workflow.actions.properties.weather.conditions", correctTypedFunction: "conditionDetail", description: """
                                Gets a detail about the given condition.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "decodeURL": Action<DecodeURLParameter>(name: "Decode URL", identifier: "is.workflow.actions.urlencode", correctTypedFunction: "decodeURL", description: """
                                Converts URL encoded text to normal characters.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "WFEncodeMode", value: "Decode"),

                                ]),
  "videoFromGif": Action<VideoFromGifParameter>(name: "Make Video from GIF", identifier: "is.workflow.actions.makevideofromgif", correctTypedFunction: "videoFromGif", description: """
                                Creates a video from a GIF. It's pronounced GIF
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "showInCalendar": Action<ShowInCalendarParameter>(name: "Show in Calendar", identifier: "is.workflow.actions.showincalendar", correctTypedFunction: "showInCalendar", description: """
                                Shows the provided event on the calendar.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "downloadURL": Action<DownloadURLParameter>(name: "Get Contents of URL", identifier: "is.workflow.actions.downloadurl", correctTypedFunction: "downloadURL", description: """
                                Downloads the contents at the given URL. When making a form or JSON request, use the request JSON parameter. The JSON form does not except variables, it must be written in JSON or using the dictionary builder. When using a file request type, use the request variable parameter.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "deviceDetails": Action<DeviceDetailsParameter>(name: "Get Device Details", identifier: "is.workflow.actions.getdevicedetails", correctTypedFunction: "deviceDetails", description: """
                                Retrieves a detail about the device.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "artistDetail": Action<ArtistDetailParameter>(name: "Get iTunes Artist Detail", identifier: "is.workflow.actions.properties.itunesartist", correctTypedFunction: "artistDetail", description: """
                                Gets a detail about the iTunes artist.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getDateFrom": Action<GetDateFromParameter>(name: "Get Date From Input", identifier: "is.workflow.actions.detect.date", correctTypedFunction: "getDateFrom", description: """
                                Gets the dates from the given input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getContactsFrom": Action<GetContactsFromParameter>(name: "Get Contacts From Input", identifier: "is.workflow.actions.detect.contacts", correctTypedFunction: "getContactsFrom", description: """
                                Gets contacts from the given input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getLastLivePhoto": Action<GetLastLivePhotoParameter>(name: "Get Last Live Photos", identifier: "is.workflow.actions.getlatestlivephotos", correctTypedFunction: "getLastLivePhoto", description: """
                                Retrieves the last n live photos you took.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "filterCalendar": Action<FilterCalendarParameter>(name: "Filter Calendar Events", identifier: "is.workflow.actions.filter.calendarevents", correctTypedFunction: "filterCalendar", description: """
                                Filters the given events. Placing All Events in the input will allow you to filter all of your calendar events.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "spokenAudioFromText": Action<SpokenAudioFromTextParameter>(name: "Make Spoken Audio from Text", identifier: "is.workflow.actions.makespokenaudiofromtext", correctTypedFunction: "spokenAudioFromText", description: """
                                Create's spoken audio from the given text
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "resizeImage": Action<ResizeImageParameter>(name: "Resize Image", identifier: "is.workflow.actions.image.resize", correctTypedFunction: "resizeImage", description: """
                                Resizes an image to a certain height and width.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "batteryLevel": Action<BatteryLevelParameter>(name: "Battery Level", identifier: "is.workflow.actions.getbatterylevel", correctTypedFunction: "batteryLevel", description: """
                                Retrieves the devices battery level.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "uploadPhotos": Action<UploadPhotosParameter>(name: "Upload Photos To Shared Album", identifier: "com.apple.mobileslideshow.StreamShareService", correctTypedFunction: "uploadPhotos", description: """
                                Uploads the given photos to the shared photos album.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "overlayText": Action<OverlayTextParameter>(name: "Overlay Text", identifier: "is.workflow.actions.overlaytext", correctTypedFunction: "overlayText", description: """
                                Overlay's Text onto an image
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getURLSFromInput": Action<GetURLSFromInputParameter>(name: "Get URLS From Input", identifier: "is.workflow.actions.detect.link", correctTypedFunction: "getURLSFromInput", description: """
                                Retrieves URLS from the input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "cellularDetails": Action<CellularDetailsParameter>(name: "Get Cellular Details", identifier: "is.workflow.actions.getwifi", correctTypedFunction: "cellularDetails", description: """
                                Gets a detail about the devices Cellular Connection.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "WFNetworkDetailsNetwork", value: "Cellular"),

                                ]),
  "getImagesFrom": Action<GetImagesFromParameter>(name: "Get Images From Input", identifier: "is.workflow.actions.detect.images", correctTypedFunction: "getImagesFrom", description: """
                                Gets Images from the given input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getFile": Action<GetFileParameter>(name: "Get File", identifier: "is.workflow.actions.documentpicker.open", correctTypedFunction: "getFile", description: """
                                Retrieves the file at a given path. It can also open a document picker if there is no path provided and the picker parameter is set to true.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "makeGIF": Action<MakeGIFParameter>(name: "Create GIF", identifier: "is.workflow.actions.makegif", correctTypedFunction: "makeGIF", description: """
                                Creates a GIF from the provided input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "openURL": Action<OpenURLParameter>(name: "Open URL", identifier: "is.workflow.actions.openurl", correctTypedFunction: "openURL", description: """
                                Opens the given URL.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "formatNumber": Action<FormatNumberParameter>(name: "Format Number", identifier: "is.workflow.actions.format.number", correctTypedFunction: "formatNumber", description: """
                                Formats a number to the given decimal places.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "resizeWindow": Action<ResizeWindowParameter>(name: "Resize Window", identifier: "is.workflow.actions.resizewindow", correctTypedFunction: "resizeWindow", description: """
                                Resize the given window.
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "urlContents": Action<UrlContentsParameter>(name: "Contents Of URL", identifier: "is.workflow.actions.getwebpagecontents", correctTypedFunction: "urlContents", description: """
                                Retrieves the contents of a url. Returns a webpage.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "labelFile": Action<LabelFileParameter>(name: "Label File", identifier: "is.workflow.actions.file.label", correctTypedFunction: "labelFile", description: """
                                Sets the given file's labels to the given label.
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "ejectDisk": Action<EjectDiskParameter>(name: "Eject Disk", identifier: "is.workflow.actions.ejectdisk", correctTypedFunction: "ejectDisk", description: """
                                Eject's the provided disk from the machine.
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "moveWindow": Action<MoveWindowParameter>(name: "Move Window", identifier: "is.workflow.actions.movewindow", correctTypedFunction: "moveWindow", description: """
                                Move the given window.
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "openIn": Action<OpenInParameter>(name: "Open In", identifier: "is.workflow.actions.openin", correctTypedFunction: "openIn", description: """
                                Opens input in a certain ask.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getPageRSS": Action<GetPageRSSParameter>(name: "Get RSS From Page", identifier: "is.workflow.actions.rss.extract", correctTypedFunction: "getPageRSS", description: """
                                Retrieves RSS feeds from page.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "detectLanguage": Action<DetectLanguageParameter>(name: "Detect Language", identifier: "is.workflow.actions.detectlanguage", correctTypedFunction: "detectLanguage", description: """
                                Detects the language of the given text.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "encodeURL": Action<EncodeURLParameter>(name: "Encode URL", identifier: "is.workflow.actions.urlencode", correctTypedFunction: "encodeURL", description: """
                                Encodes the given text in URL allowed characters.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "WFEncodeMode", value: "Encode"),

                                ]),
  "expandURL": Action<ExpandURLParameter>(name: "Expand URL", identifier: "is.workflow.actions.url.expand", correctTypedFunction: "expandURL", description: """
                                Expands the given URL.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "prependFile": Action<PrependFileParameter>(name: "Prepend File", identifier: "is.workflow.actions.file.append", correctTypedFunction: "prependFile", description: """
                                Prepends contents to the file.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "WFAppendFileWriteMode", value: "Prepend"),

                                ]),
  "podcastEpisodeDetail": Action<PodcastEpisodeDetailParameter>(name: "Get Podcast Episode Detail", identifier: "is.workflow.actions.properties.podcast", correctTypedFunction: "podcastEpisodeDetail", description: """
                                Gets a detail about the given Podcast episode. Checkout ATP btw it's a super good show.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "number": Action<NumberParameter>(name: "Number", identifier: "is.workflow.actions.number", correctTypedFunction: "number", description: """
                                Declares a number.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "dictateText": Action<DictateTextParameter>(name: "Dictate Text", identifier: "is.workflow.actions.dictatetext", correctTypedFunction: "dictateText", description: """
                                Creates text from a dictation.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "urlComponent": Action<UrlComponentParameter>(name: "Get URL Component", identifier: "is.workflow.actions.geturlcomponent", correctTypedFunction: "urlComponent", description: """
                                Retrieves component about URL.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "setClipboard": Action<SetClipboardParameter>(name: "Set Clipboard", identifier: "is.workflow.actions.setclipboard", correctTypedFunction: "setClipboard", description: """
                                Sets the devices clipboard to the input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "hash": Action<HashParameter>(name: "Hash", identifier: "is.workflow.actions.hash", correctTypedFunction: "hash", description: """
                                Hashes the provided input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getAddressFrom": Action<GetAddressFromParameter>(name: "Get Address From Input", identifier: "is.workflow.actions.detect.address", correctTypedFunction: "getAddressFrom", description: """
                                Gets addresses from the given input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "splitText": Action<SplitTextParameter>(name: "Split Text", identifier: "is.workflow.actions.text.split", correctTypedFunction: "splitText", description: """
                                Splits the text by a separator. If the separator is set to Custom you can add a customSeparator to split by any character you want.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "selectPhoto": Action<SelectPhotoParameter>(name: "Select Photo", identifier: "is.workflow.actions.selectphoto", correctTypedFunction: "selectPhoto", description: """
                                Allows you to select a photo.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "renameFile": Action<RenameFileParameter>(name: "Rename File", identifier: "is.workflow.actions.file.rename", correctTypedFunction: "renameFile", description: """
                                Renames the given file.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "hideAllApps": Action<HideAllAppsParameter>(name: "Hide All Apps", identifier: "is.workflow.actions.hide.app", correctTypedFunction: "hideAllApps", description: """
                                Hide's all apps that are currently open. Any apps provided in the except parameter, will not be hidden.
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    ActionPreset(path: "WFHideAppMode", value: "All Apps"),

                                ]),
  "nothing": Action<NothingParameter>(name: "Nothing", identifier: "is.workflow.actions.nothing", correctTypedFunction: "nothing", description: """
                                Does nothing.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "debugShortcut": Action<DebugShortcutParameter>(name: "Debug Content Attribution", identifier: "is.workflow.actions.debug.contentattribution", correctTypedFunction: "debugShortcut", description: """
                                A weird debug action.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "extractTextFromImage": Action<ExtractTextFromImageParameter>(name: "Extract Text From Image", identifier: "is.workflow.actions.extracttextfromimage", correctTypedFunction: "extractTextFromImage", description: """
                                Extracts the text from an image
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "date": Action<DateParameter>(name: "Date", identifier: "is.workflow.actions.date", correctTypedFunction: "date", description: """
                                Creates a Date.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "WFDateActionMode", value: "Specified Date"),

                                ]),
  "encodeAudio": Action<EncodeAudioParameter>(name: "Encode Audio", identifier: "is.workflow.actions.encodemedia", correctTypedFunction: "encodeAudio", description: """
                                Encodes the given audio.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    ActionPreset(path: "WFMediaAudioOnly", value: "true"),

                                ]),
  "getShortcuts": Action<GetShortcutsParameter>(name: "Get Shortcuts", identifier: "is.workflow.actions.getmyworkflows", correctTypedFunction: "getShortcuts", description: """
                                Retrieves a list of all of your shortcuts.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "attendeeDetail": Action<AttendeeDetailParameter>(name: "Get Attendee Detail", identifier: "is.workflow.actions.properties.eventattendees", correctTypedFunction: "attendeeDetail", description: """
                                Gets a detail about the given event attendee.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "createQR": Action<CreateQRParameter>(name: "Create QR Code", identifier: "is.workflow.actions.generatebarcode", correctTypedFunction: "createQR", description: """
                                Creates a QR for the given text.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getPhonesFrom": Action<GetPhonesFromParameter>(name: "Get Phone Numbers From Input", identifier: "is.workflow.actions.detect.phonenumber", correctTypedFunction: "getPhonesFrom", description: """
                                Gets phone numbers from the given input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "output": Action<OutputParameter>(name: "Output", identifier: "is.workflow.actions.output", correctTypedFunction: "output", description: """
                                Outputs the given input as the shortcuts result. If there is no where to output, the result behavior is used to determine what should be done with the result.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "createPlaylist": Action<CreatePlaylistParameter>(name: "Create Playlist", identifier: "is.workflow.actions.createplaylist", correctTypedFunction: "createPlaylist", description: """
                                Creates a playlist with the given music, name, author and description.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "selectedEmail": Action<SelectedEmailParameter>(name: "Select Email", identifier: "is.workflow.actions.selectemail", correctTypedFunction: "selectedEmail", description: """
                                Allows you to select a contact's email.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "setName": Action<SetNameParameter>(name: "Set Name", identifier: "is.workflow.actions.setitemname", correctTypedFunction: "setName", description: """
                                Sets the name of an item.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "setVoiceData": Action<SetVoiceDataParameter>(name: "Set Voice Data", identifier: "is.workflow.actions.cellular.rat.set", correctTypedFunction: "setVoiceData", description: """
                                Set's the devices cellular data settings. Can be used to change the current sim, and cell mode (4G, LTE, 5G).
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "quicklook": Action<QuicklookParameter>(name: "Quicklook", identifier: "is.workflow.actions.previewdocument", correctTypedFunction: "quicklook", description: """
                                Quicklooks the provided input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "alert": Action<AlertParameter>(name: "Send Alert", identifier: "is.workflow.actions.alert", correctTypedFunction: "alert", description: """
                                Shows the user an alert.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "playSound": Action<PlaySoundParameter>(name: "Play Sound", identifier: "is.workflow.actions.playsound", correctTypedFunction: "playSound", description: """
                                Play's the sound from the given input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "flipImage": Action<FlipImageParameter>(name: "Flip Image", identifier: "is.workflow.actions.image.flip", correctTypedFunction: "flipImage", description: """
                                Flips an image.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "openShortcut": Action<OpenShortcutParameter>(name: "Open Shortcut", identifier: "is.workflow.actions.openworkflow", correctTypedFunction: "openShortcut", description: """
                                Opens the shortcut editor to the specified Shortcut.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "searchWeb": Action<SearchWebParameter>(name: "Search Web", identifier: "is.workflow.actions.searchweb", correctTypedFunction: "searchWeb", description: """
                                Searches the desired browser .
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "filterFiles": Action<FilterFilesParameter>(name: "Filter File", identifier: "is.workflow.actions.filter.files", correctTypedFunction: "filterFiles", description: """
                                Filters the given files.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getDictionaryFrom": Action<GetDictionaryFromParameter>(name: "Get Dictionary From Input", identifier: "is.workflow.actions.detect.dictionary", correctTypedFunction: "getDictionaryFrom", description: """
                                Gets a dictionary from the given input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "list": Action<ListParameter>(name: "List", identifier: "is.workflow.actions.list", correctTypedFunction: "list", description: """
                                Creates a list.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getItemFromList": Action<GetItemFromListParameter>(name: "Get Item From List", identifier: "is.workflow.actions.getitemfromlist", correctTypedFunction: "getItemFromList", description: """
                                Gets an item from the given list. If you choose to get items in range you can use the startIndex and endIndex to define the range, you do not need to give it an index.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getTimeBetween": Action<GetTimeBetweenParameter>(name: "Get Time Between Dates", identifier: "is.workflow.actions.gettimebetweendates", correctTypedFunction: "getTimeBetween", description: """
                                Retrieves the time between the two dates.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "sampleDetail": Action<SampleDetailParameter>(name: "Get Health Sample Detail", identifier: "is.workflow.actions.properties.health.quantity", correctTypedFunction: "sampleDetail", description: """
                                Gets a detail about the given health sample.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getRSSItems": Action<GetRSSItemsParameter>(name: "Get RSS Items From Feed", identifier: "is.workflow.actions.rss", correctTypedFunction: "getRSSItems", description: """
                                Gets the RSS items from an RSS Feed.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "splitPDF": Action<SplitPDFParameter>(name: "Split PDF", identifier: "is.workflow.actions.splitpdf", correctTypedFunction: "splitPDF", description: """
                                Split the given PDF into pages.
                                """, lowestCompatibleHost: .iOS15, presets: [
                                    
                                ]),
  "contentGraph": Action<ContentGraphParameter>(name: "View Content Graph", identifier: "is.workflow.actions.viewresult", correctTypedFunction: "contentGraph", description: """
                                Displays a content graph of variable.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "skipForward": Action<SkipForwardParameter>(name: "Skip Forward", identifier: "is.workflow.actions.skipforward", correctTypedFunction: "skipForward", description: """
                                Skips forward in the current media queue.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "share": Action<ShareParameter>(name: "Share", identifier: "is.workflow.actions.share", correctTypedFunction: "share", description: """
                                Shares the input.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "startScreensaver": Action<StartScreensaverParameter>(name: "Start Screensaver", identifier: "is.workflow.actions.startscreensaver", correctTypedFunction: "startScreensaver", description: """
                                Start's your computers screensaver
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "makeDiskImage": Action<MakeDiskImageParameter>(name: "Make Disk Image", identifier: "is.workflow.actions.makediskimage", correctTypedFunction: "makeDiskImage", description: """
                                Create's a disk image with the given parameters.
                                """, lowestCompatibleHost: .macOS12, presets: [
                                    
                                ]),
  "searchItunes": Action<SearchItunesParameter>(name: "Search iTunes", identifier: "is.workflow.actions.searchitunes", correctTypedFunction: "searchItunes", description: """
                                Searches iTunes based of the parameters you provide..
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),

    ]
}
