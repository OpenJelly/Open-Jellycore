//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension TranspilerLookupTables {
    static var ToolboxFunctions: [String : AnyAction] = [
  "getDeviceMotionIAIH": Action<GetDeviceMotionIAIHParameter>(name: "Get Device Motion", identifier: "com.alexhay.ToolboxProForShortcuts.GetDeviceMotionIAIHIntent", correctTypedFunction: "getDeviceMotionIAIH", description: """
                                Get the current motion of your device
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "tagFiles": Action<TagFilesParameter>(name: "Tag Files", identifier: "com.alexhay.ToolboxProForShortcuts.TagFilesIntent", correctTypedFunction: "tagFiles", description: """
                                Add tags to the chosen file. These tags can be viewed when the file is saved into the Files app
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "scanDocument": Action<ScanDocumentParameter>(name: "Scan Document", identifier: "com.alexhay.ToolboxProForShortcuts.ScanDocumentIntent", correctTypedFunction: "scanDocument", description: """
                                Use the iOS document scanner to scan a document. The resulting image or recognised text is copied to the clipboard, add a 'wait to return' and 'get clipboard' action after this one to use the results.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "smartCrop": Action<SmartCropParameter>(name: "Create Interest Heatmap", identifier: "com.alexhay.ToolboxProForShortcuts.SmartCropIntent", correctTypedFunction: "smartCrop", description: """
                                Generate a heatmap of the most interesting part of an image. The result is generated in the Toolbox Pro app and is copied to the clipboard. Add a 'wait to return' and 'get clipboard' action after this one to use the result.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "createIcon": Action<CreateIconParameter>(name: "Create Icon", identifier: "com.alexhay.ToolboxProForShortcuts.CreateIconIntent", correctTypedFunction: "createIcon", description: """
                                Create an icon with a coloured background. Small icons are created directly in Shortcuts, larger icons are generated in the Toolbox Pro app and will be copied to the clipboard. Add a "wait to return" and "get clipboard" action after this one to use it.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getPhotoAlbums": Action<GetPhotoAlbumsParameter>(name: "Get Photo Albums", identifier: "com.alexhay.ToolboxProForShortcuts.GetPhotoAlbumsIntent", correctTypedFunction: "getPhotoAlbums", description: """
                                Retrieve a list of the album names in the Photos library
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getCalendars": Action<GetCalendarsParameter>(name: "Get Calendars", identifier: "com.alexhay.ToolboxProForShortcuts.GetCalendarsIntent", correctTypedFunction: "getCalendars", description: """
                                Retrieve a list of the existing calendars
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "createMenu": Action<CreateMenuParameter>(name: "Create Menu Item", identifier: "com.alexhay.ToolboxProForShortcuts.CreateMenuIntent", correctTypedFunction: "createMenu", description: """
                                Create a rich visual menu item with a title, subtitle & icon. Add to a variable as a contact and then choose list on that variable.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "findGamesRawg": Action<FindGamesRawgParameter>(name: "Find Games", identifier: "com.alexhay.ToolboxProForShortcuts.FindGamesRawgIntent", correctTypedFunction: "findGamesRawg", description: """
                                Find information about video games that match your search criteria 
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "createFolders": Action<CreateFoldersParameter>(name: "Create Folders", identifier: "com.alexhay.ToolboxProForShortcuts.CreateFoldersIntent", correctTypedFunction: "createFolders", description: """
                                Create folders in the chosen bookmarked folders. You can enter nested paths like "Folder  1/Folder 2" and all required folders will be created.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "bookmarkFile": Action<BookmarkFileParameter>(name: "Bookmark File", identifier: "com.alexhay.ToolboxProForShortcuts.BookmarkFileIntent", correctTypedFunction: "bookmarkFile", description: """
                                Access files outside of the Shortcuts folder without having to select a file manually each time. You can also delete bookmarks or get all bookmark names.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "scanNFC": Action<ScanNFCParameter>(name: "Scan NFC", identifier: "com.alexhay.ToolboxProForShortcuts.ScanNFCIntent", correctTypedFunction: "scanNFC", description: """
                                Read from or write text data to an NFC tag. The resulting text is copied to the clipboard. Add a 'wait to return' and 'get clipboard' action after this one to use the results.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "parseWebsiteSource": Action<ParseWebsiteSourceParameter>(name: "Parse Website Source", identifier: "com.alexhay.ToolboxProForShortcuts.ParseWebsiteSourceIntent", correctTypedFunction: "parseWebsiteSource", description: """
                                Get the source HTML of the chosen website, or certain elements 
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "removeEmoji": Action<RemoveEmojiParameter>(name: "Remove Emoji", identifier: "com.alexhay.ToolboxProForShortcuts.RemoveEmojiIntent", correctTypedFunction: "removeEmoji", description: """
                                Remove emoji and special characters from the given text.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "createEvent": Action<CreateEventParameter>(name: "Create Calendar Event", identifier: "com.alexhay.ToolboxProForShortcuts.CreateEventIntent", correctTypedFunction: "createEvent", description: """
                                Add a new event to your calendar
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "authenticate": Action<AuthenticateParameter>(name: "Authenticate", identifier: "com.alexhay.ToolboxProForShortcuts.AuthenticateIntent", correctTypedFunction: "authenticate", description: """
                                Authenticate the user using FaceID or TouchID. The resulting 'true' or 'false' is copied to the clipboard. Use a 'wait to return' and 'get clipboard' action after this one.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "addToList": Action<AddToListParameter>(name: "Add To List", identifier: "com.alexhay.ToolboxProForShortcuts.AddToListIntent", correctTypedFunction: "addToList", description: """
                                Add the given item to a list at the chosen position
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "bugExample": Action<BugExampleParameter>(name: "Bug Example", identifier: "com.alexhay.ToolboxProForShortcuts.BugExampleIntent", correctTypedFunction: "bugExample", description: """
                                An example of an in-app intents issue
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "reverseList": Action<ReverseListParameter>(name: "Reverse List Order", identifier: "com.alexhay.ToolboxProForShortcuts.ReverseListIntent", correctTypedFunction: "reverseList", description: """
                                Given a list of items, this tool will reverse the order.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "createMatte": Action<CreateMatteParameter>(name: "Create Solid Matte", identifier: "com.alexhay.ToolboxProForShortcuts.CreateMatteIntent", correctTypedFunction: "createMatte", description: """
                                Create a matte image with your choice of colour and size.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getUTI": Action<GetUTIParameter>(name: "Get Uniform Type Identifier (UTI)", identifier: "com.alexhay.ToolboxProForShortcuts.GetUTIIntent", correctTypedFunction: "getUTI", description: """
                                Get the Uniform Type Identifier (UTI) from the chosen file
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "addPhotoAlbum": Action<AddPhotoAlbumParameter>(name: "Add Photo Album", identifier: "com.alexhay.ToolboxProForShortcuts.AddPhotoAlbumIntent", correctTypedFunction: "addPhotoAlbum", description: """
                                Add a new album or folder to your photo library
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "editPendingNotifications": Action<EditPendingNotificationsParameter>(name: "Edit Notifications", identifier: "com.alexhay.ToolboxProForShortcuts.EditPendingNotificationsIntent", correctTypedFunction: "editPendingNotifications", description: """
                                View or delete Toolbox Pro notifications
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getTvShowDetails": Action<GetTvShowDetailsParameter>(name: "Get TV Show Details", identifier: "com.alexhay.ToolboxProForShortcuts.GetTvShowDetailsIntent", correctTypedFunction: "getTvShowDetails", description: """
                                Get additional information about a TV show found using the 'Find TV Shows' tool
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "buildURL": Action<BuildURLParameter>(name: "Build URL", identifier: "com.alexhay.ToolboxProForShortcuts.BuildURLIntent", correctTypedFunction: "buildURL", description: """
                                Construct a URL from components
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "addContactGroup": Action<AddContactGroupParameter>(name: "Add/Remove Contact Group", identifier: "com.alexhay.ToolboxProForShortcuts.AddContactGroupIntent", correctTypedFunction: "addContactGroup", description: """
                                Add a new contact group to your address book or remove an existing one
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "findPlaylists": Action<FindPlaylistsParameter>(name: "Find Playlists", identifier: "com.alexhay.ToolboxProForShortcuts.FindPlaylistsIntent", correctTypedFunction: "findPlaylists", description: """
                                Find playlists in the Music catalogue (these are not the playlists in your library)
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "isTheSunUp": Action<IsTheSunUpParameter>(name: "Is The Sun Up", identifier: "com.alexhay.ToolboxProForShortcuts.IsTheSunUpIntent", correctTypedFunction: "isTheSunUp", description: """
                                Use the given location to determine whether it is light or dark outside.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getTextFromImagesIAIH": Action<GetTextFromImagesIAIHParameter>(name: "Get Text From Images", identifier: "com.alexhay.ToolboxProForShortcuts.GetTextFromImagesIAIHIntent", correctTypedFunction: "getTextFromImagesIAIH", description: """
                                Use on-device optical character regonition, or 'OCR', to identify text in the given images.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "splitPDF": Action<Toolbox_SplitPDFParameter>(name: "Split PDF", identifier: "com.alexhay.ToolboxProForShortcuts.SplitPDFIntent", correctTypedFunction: "splitPDF", description: """
                                Split a PDF into individual pages or count how many pages there are
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "scaleImagesIAIH": Action<ScaleImagesIAIHParameter>(name: "Scale Images", identifier: "com.alexhay.ToolboxProForShortcuts.ScaleImagesIAIHIntent", correctTypedFunction: "scaleImagesIAIH", description: """
                                Scale the given images up or down so the longest or shortest side equals this desired pixel length
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "addMusicToLibrary": Action<AddMusicToLibraryParameter>(name: "Add Music To Library", identifier: "com.alexhay.ToolboxProForShortcuts.AddMusicToLibraryIntent", correctTypedFunction: "addMusicToLibrary", description: """
                                Add songs, albums or playlists or songs from the Music Catalogue to your Music library
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "internetConnection": Action<InternetConnectionParameter>(name: "Get Connection Status", identifier: "com.alexhay.ToolboxProForShortcuts.InternetConnectionIntent", correctTypedFunction: "internetConnection", description: """
                                Check whether your device has an active WiFi or cellular connection to the internet
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "createTextImage": Action<CreateTextImageParameter>(name: "Create Images From Text", identifier: "com.alexhay.ToolboxProForShortcuts.CreateTextImageIntent", correctTypedFunction: "createTextImage", description: """
                                Turn text into images. You can input rich text files and use the embedded formatting or you can edit the style of plain text.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "isDarkModeOn": Action<IsDarkModeOnParameter>(name: "Is Dark Mode On", identifier: "com.alexhay.ToolboxProForShortcuts.IsDarkModeOnIntent", correctTypedFunction: "isDarkModeOn", description: """
                                Check whether dark mode is enabled
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "saveFilesToBookmarkedFolders": Action<SaveFilesToBookmarkedFoldersParameter>(name: "Save Files To Bookmarked Folders", identifier: "com.alexhay.ToolboxProForShortcuts.SaveFilesToBookmarkedFoldersIntent", correctTypedFunction: "saveFilesToBookmarkedFolders", description: """
                                Save the given files to the selected bookmarked folder. Folder bookmarks must be added first in the Settings tab of the Toolbox Pro app.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "isPremiumUnlocked": Action<IsPremiumUnlockedParameter>(name: "Is Premium Unlocked", identifier: "com.alexhay.ToolboxProForShortcuts.IsPremiumUnlockedIntent", correctTypedFunction: "isPremiumUnlocked", description: """
                                Checks whether Premium tools are unlocked in Toolbox Pro
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "isVPNConnected": Action<IsVPNConnectedParameter>(name: "Is VPN Connected", identifier: "com.alexhay.ToolboxProForShortcuts.IsVPNConnectedIntent", correctTypedFunction: "isVPNConnected", description: """
                                Check whether your device is connected to a VPN
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "smartMenu": Action<SmartMenuParameter>(name: "Edit list", identifier: "com.alexhay.ToolboxProForShortcuts.SmartMenuIntent", correctTypedFunction: "smartMenu", description: """
                                Rearrange or delete from a list of text or images. This tool runs in Toolbox Pro. Selecting the item or saving the list will return to Shortcuts by default with the result copied to the clipboard. Add a 'wait to return' and a 'get clipboard' action after this one to use the results.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "home": Action<HomeParameter>(name: "Return Home", identifier: "com.alexhay.ToolboxProForShortcuts.HomeIntent", correctTypedFunction: "home", description: """
                                Return to the home screen
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getTextFromImage": Action<GetTextFromImageParameter>(name: "Get Text From Images", identifier: "com.alexhay.ToolboxProForShortcuts.GetTextFromImageIntent", correctTypedFunction: "getTextFromImage", description: """
                                Identify text in the given images. The detected text is copied to the clipboard in the Toolbox Pro app before returning to Shortcuts. It's best to add a "wait to return" and a "get contents of clipboard" action after this one.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "downloadUnsplashPhotos": Action<DownloadUnsplashPhotosParameter>(name: "Download Unsplash Photos", identifier: "com.alexhay.ToolboxProForShortcuts.DownloadUnsplashPhotosIntent", correctTypedFunction: "downloadUnsplashPhotos", description: """
                                Download photos found using the 'Find Unsplash Photos' tool at your choice of size
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getW3W": Action<GetW3WParameter>(name: "Get what3words Address", identifier: "com.alexhay.ToolboxProForShortcuts.GetW3WIntent", correctTypedFunction: "getW3W", description: """
                                Get a what3words address from the given address, coordinates or location
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "deviceDetails": Action<Toolbox_DeviceDetailsParameter>(name: "Get Device Details (Extended)", identifier: "com.alexhay.ToolboxProForShortcuts.DeviceDetailsIntent", correctTypedFunction: "deviceDetails", description: """
                                Get information about your device
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "findPexelPhotos": Action<FindPexelPhotosParameter>(name: "Find Pexels Photos", identifier: "com.alexhay.ToolboxProForShortcuts.FindPexelPhotosIntent", correctTypedFunction: "findPexelPhotos", description: """
                                Search for freely-usable photos from Pexels
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "findVideos": Action<FindVideosParameter>(name: "Find Pexels Videos", identifier: "com.alexhay.ToolboxProForShortcuts.FindVideosIntent", correctTypedFunction: "findVideos", description: """
                                Search for freely-usable videos from Pexels
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "playMusic": Action<Toolbox_PlayMusicParameter>(name: "Play Music", identifier: "com.alexhay.ToolboxProForShortcuts.PlayMusicIntent", correctTypedFunction: "playMusic", description: """
                                Play track in Music. You can enter IDs for songs, albums, playlists or artists. You play queue will be replaced with the input songs in the order you add them.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "shuffleList": Action<ShuffleListParameter>(name: "Shuffle List", identifier: "com.alexhay.ToolboxProForShortcuts.ShuffleListIntent", correctTypedFunction: "shuffleList", description: """
                                Randomly sort the order of a list
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getLinksToSong": Action<GetLinksToSongParameter>(name: "Get Links To Song Or Album", identifier: "com.alexhay.ToolboxProForShortcuts.GetLinksToSongIntent", correctTypedFunction: "getLinksToSong", description: """
                                Get URLs for a song or album from different services using Odesli (formerly SongLink).
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getColours": Action<GetColoursParameter>(name: "Get Colours As Hex", identifier: "com.alexhay.ToolboxProForShortcuts.GetColoursIntent", correctTypedFunction: "getColours", description: """
                                Returns the hex code for a selection of common colours
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "deviceLanguage": Action<DeviceLanguageParameter>(name: "Device Language", identifier: "com.alexhay.ToolboxProForShortcuts.DeviceLanguageIntent", correctTypedFunction: "deviceLanguage", description: """
                                Get the preferred language and primary locale of the device
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "findMovies": Action<FindMoviesParameter>(name: "Find Movies", identifier: "com.alexhay.ToolboxProForShortcuts.FindMovies2Intent", correctTypedFunction: "findMovies", description: """
                                Search TMDb for Movies matching your search criteria.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "pingServer": Action<PingServerParameter>(name: "Query Server", identifier: "com.alexhay.ToolboxProForShortcuts.PingServerIntent", correctTypedFunction: "pingServer", description: """
                                Query a server and return the status code, descripton or headers
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getDetailFromText": Action<GetDetailFromTextParameter>(name: "Get Detail From Text", identifier: "com.alexhay.ToolboxProForShortcuts.GetDetailFromTextIntent", correctTypedFunction: "getDetailFromText", description: """
                                Get the names of people or places, detect the language or sentiment from the given text.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getFilesFromBookmarkedFolder": Action<GetFilesFromBookmarkedFolderParameter>(name: "Get Files From Bookmarked Folder", identifier: "com.alexhay.ToolboxProForShortcuts.GetFilesFromBookmarkedFolderIntent", correctTypedFunction: "getFilesFromBookmarkedFolder", description: """
                                Retrieve files from inside a bookmarked folder. Folder bookmarks must be added first in the Settings tab of the Toolbox Pro app. Use "example.txt" for a file inside the bookmarked folder or "folder1/folder2/example.txt" for nested files. File paths are case-sensitive.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getLocationFromW3W": Action<GetLocationFromW3WParameter>(name: "Get Location From what3words", identifier: "com.alexhay.ToolboxProForShortcuts.GetLocationFromW3WIntent", correctTypedFunction: "getLocationFromW3W", description: """
                                Get a location from the given what3words address. Should be formatted as follows: "garden.scores.spirit"
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "addTracksToPlaylist": Action<AddTracksToPlaylistParameter>(name: "Add Tracks To Playlists", identifier: "com.alexhay.ToolboxProForShortcuts.AddTracksToPlaylistIntent", correctTypedFunction: "addTracksToPlaylist", description: """
                                Add tracks to the selected library playlists
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getReminderLists": Action<GetReminderListsParameter>(name: "Get Reminder Lists", identifier: "com.alexhay.ToolboxProForShortcuts.GetReminderListsIntent", correctTypedFunction: "getReminderLists", description: """
                                Retrieve the names and details of all your reminder lists.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "resizeImageExtended": Action<ResizeImageExtendedParameter>(name: "Scale Image", identifier: "com.alexhay.ToolboxProForShortcuts.ResizeImageExtendedIntent", correctTypedFunction: "resizeImageExtended", description: """
                                Resize an image by providing a new size for the longest or shortest edge.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "console": Action<ConsoleParameter>(name: "Print To Console", identifier: "com.alexhay.ToolboxProForShortcuts.ConsoleIntent", correctTypedFunction: "console", description: """
                                Print text to a log, retrieve the log or clear its contents. Useful for debugging complex shortcuts. You can toggle logging in Toolbox Pro's settings.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getLocationFromCoords": Action<GetLocationFromCoordsParameter>(name: "Get Location From Coordinates", identifier: "com.alexhay.ToolboxProForShortcuts.GetLocationFromCoordsIntent", correctTypedFunction: "getLocationFromCoords", description: """
                                Returns a Shortcuts location from the given coordinates.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "editReminder": Action<EditReminderParameter>(name: "Edit Reminder", identifier: "com.alexhay.ToolboxProForShortcuts.EditReminderIntent", correctTypedFunction: "editReminder", description: """
                                Using a unique ID from the 'Create Reminder' or 'Get Reminder UUID' tools, mark a reminder as completed, edit it, open it in the Reminders app, delete it or get its details.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "searchForEmoji": Action<SearchForEmojiParameter>(name: "Find Emoji", identifier: "com.alexhay.ToolboxProForShortcuts.SearchForEmojiIntent", correctTypedFunction: "searchForEmoji", description: """
                                Find emoji that match your search criteria.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "createCalendar": Action<CreateCalendarParameter>(name: "Create Calendar", identifier: "com.alexhay.ToolboxProForShortcuts.CreateCalendarIntent", correctTypedFunction: "createCalendar", description: """
                                Create a new calendar
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "calculateWithSoulver": Action<CalculateWithSoulverParameter>(name: "Calculate With Soulver", identifier: "com.alexhay.ToolboxProForShortcuts.CalculateWithSoulverIntent", correctTypedFunction: "calculateWithSoulver", description: """
                                Use the natural language calculation engine from Soulver to evaluate the given expressions. See the documentation in-app for examples.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "convertCurrency": Action<ConvertCurrencyParameter>(name: "Convert Currency", identifier: "com.alexhay.ToolboxProForShortcuts.ConvertCurrencyIntent", correctTypedFunction: "convertCurrency", description: """
                                Convert one currency to another using the European Central Bank's rates.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "createPlaylist": Action<Toolbox_CreatePlaylistParameter>(name: "Create Music Playlist", identifier: "com.alexhay.ToolboxProForShortcuts.CreatePlaylistIntent", correctTypedFunction: "createPlaylist", description: """
                                Create a new playlist in Music
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "globalVariables": Action<GlobalVariablesParameter>(name: "Global Variables", identifier: "com.alexhay.ToolboxProForShortcuts.GlobalVariablesIntent", correctTypedFunction: "globalVariables", description: """
                                Set, get and delete global variables that persist between your shortcuts and sync between your devices.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getRelativeDate": Action<GetRelativeDateParameter>(name: "Get Relative Date Description", identifier: "com.alexhay.ToolboxProForShortcuts.GetRelativeDateIntent", correctTypedFunction: "getRelativeDate", description: """
                                Get a description of the given date as relative to now - eg "Yesterday" or "next year"
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "salientCrop": Action<SalientCropParameter>(name: "Smart Crop", identifier: "com.alexhay.ToolboxProForShortcuts.SalientCropIntent", correctTypedFunction: "salientCrop", description: """
                                Automatically crop images to the region of greatest interest
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getPlaylists": Action<GetPlaylistsParameter>(name: "Get Playlists from library", identifier: "com.alexhay.ToolboxProForShortcuts.GetPlaylistsIntent", correctTypedFunction: "getPlaylists", description: """
                                Get your playlists from Music 
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getLocationFromText": Action<GetLocationFromTextParameter>(name: "Get Location From Text", identifier: "com.alexhay.ToolboxProForShortcuts.GetLocationFromTextIntent", correctTypedFunction: "getLocationFromText", description: """
                                Get a location from the given text
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getAudioOutputs": Action<GetAudioOutputsParameter>(name: "Get Audio Output Device", identifier: "com.alexhay.ToolboxProForShortcuts.GetAudioOutputsIntent", correctTypedFunction: "getAudioOutputs", description: """
                                Detect details about the current audio output device - can be a wired or BlueTooth connection
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getMovieDetails": Action<GetMovieDetailsParameter>(name: "Get Movie Details", identifier: "com.alexhay.ToolboxProForShortcuts.GetMovieDetails2Intent", correctTypedFunction: "getMovieDetails", description: """
                                Get additional information about a movie found using the 'Find Movies' tool
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "isAudioPlaying": Action<IsAudioPlayingParameter>(name: "Is Audio Playing", identifier: "com.alexhay.ToolboxProForShortcuts.IsAudioPlayingIntent", correctTypedFunction: "isAudioPlaying", description: """
                                Checks whether there is currently audio playing on the device.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "checkGV": Action<CheckGVParameter>(name: "Check If Global Variable Exists", identifier: "com.alexhay.ToolboxProForShortcuts.CheckGVIntent", correctTypedFunction: "checkGV", description: """
                                Check if a global variable already exists with an option to create it if it doesn't.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "hapticFeedback": Action<HapticFeedbackParameter>(name: "Haptic Feedback", identifier: "com.alexhay.ToolboxProForShortcuts.HapticFeedbackIntent", correctTypedFunction: "hapticFeedback", description: """
                                Generate the chosen haptic feedback using your device's Taptic Engine. iPhones 8 and later. Doesn't work on iPads.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "quickMenuLegacy": Action<QuickMenuLegacyParameter>(name: "Quick Menu (Legacy)", identifier: "com.alexhay.ToolboxProForShortcuts.QuickMenuIntent", correctTypedFunction: "quickMenuLegacy", description: """
                                Create a menu using specially formatted text. Check the tool description in the Toolbox Pro app for the formatting.

                                Important: Add a Choose From List action after this one and change the type of the input from ‘File‘ to ‘Contact‘ to see your menu‘s images in the list.

                                This legacy version uses a Contacts workaround to display images in menus. The new Quick Menu tool creates non-contact objects which do not require changing their type.

                                This legacy tool will be removed in a future version of Toolbox Pro.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "createReminder": Action<CreateReminderParameter>(name: "Create Reminder", identifier: "com.alexhay.ToolboxProForShortcuts.CreateReminderIntent", correctTypedFunction: "createReminder", description: """
                                Create a new reminder and return its unique identifier
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "createInterestHeatMaps": Action<CreateInterestHeatMapsParameter>(name: "Create Interest Heatmaps", identifier: "com.alexhay.ToolboxProForShortcuts.CreateInterestHeatMapsIntent", correctTypedFunction: "createInterestHeatMaps", description: """
                                Generate heatmaps of the most interesting part of the given images.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "findAlbums": Action<FindAlbumsParameter>(name: "Find Albums", identifier: "com.alexhay.ToolboxProForShortcuts.FindAlbumsIntent", correctTypedFunction: "findAlbums", description: """
                                Search the Music catalogue for albums
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getSymbolName": Action<GetSymbolNameParameter>(name: "Get Symbol Name", identifier: "com.alexhay.ToolboxProForShortcuts.GetSymbolNameIntent", correctTypedFunction: "getSymbolName", description: """
                                Get a symbol name to use in the Create Menu Item or Create Icon tools
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "recogniseObjectsInImage": Action<RecogniseObjectsInImageParameter>(name: "Recognise Objects In Image", identifier: "com.alexhay.ToolboxProForShortcuts.RecogniseObjectsInImageIntent", correctTypedFunction: "recogniseObjectsInImage", description: """
                                Use machine learning to classify the contents of an image.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "deviceStorage": Action<DeviceStorageParameter>(name: "Get Device Storage", identifier: "com.alexhay.ToolboxProForShortcuts.DeviceStorageIntent", correctTypedFunction: "deviceStorage", description: """
                                See how much space you have left on your device.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "listContentsOfBookmarkedFolder": Action<ListContentsOfBookmarkedFolderParameter>(name: "List Contents Of Bookmarked Folder", identifier: "com.alexhay.ToolboxProForShortcuts.ListContentsOfBookmarkedFolderIntent", correctTypedFunction: "listContentsOfBookmarkedFolder", description: """
                                Retrieve information about the contents of a bookmarked folder
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "prettyPrint": Action<PrettyPrintParameter>(name: "Pretty Print Dictionaries", identifier: "com.alexhay.ToolboxProForShortcuts.PrettyPrintIntent", correctTypedFunction: "prettyPrint", description: """
                                Format JSON dictionaries into more legible layouts.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "sortDictionaries": Action<SortDictionariesParameter>(name: "Sort Dictionaries", identifier: "com.alexhay.ToolboxProForShortcuts.SortDictionariesIntent", correctTypedFunction: "sortDictionaries", description: """
                                Sort an array of dictionaries by the given key
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "deviceMotion": Action<DeviceMotionParameter>(name: "Get Device Motion", identifier: "com.alexhay.ToolboxProForShortcuts.DeviceMotionIntent", correctTypedFunction: "deviceMotion", description: """
                                Get the current motion of your device
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "detectFacesIAIH": Action<DetectFacesIAIHParameter>(name: "Detect Faces", identifier: "com.alexhay.ToolboxProForShortcuts.DetectFacesIAIHIntent", correctTypedFunction: "detectFacesIAIH", description: """
                                Analyse images to see if they contain faces.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "pluralise": Action<PluraliseParameter>(name: "Pluralise Word", identifier: "com.alexhay.ToolboxProForShortcuts.PluraliseIntent", correctTypedFunction: "pluralise", description: """
                                Add a singular word and a count. The plural of the word will be returned if the count is greater than 1.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "blurImages": Action<BlurImagesParameter>(name: "Blur Images", identifier: "com.alexhay.ToolboxProForShortcuts.BlurImagesIntent", correctTypedFunction: "blurImages", description: """
                                Apply a blur or pixellation effect to images
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "crop": Action<CropParameter>(name: "Crop Image Manually", identifier: "com.alexhay.ToolboxProForShortcuts.CropIntent", correctTypedFunction: "crop", description: """
                                Crop an image using manual tools. The cropped image is copied to the clipboard and Shortcuts is opened when finished. Use a 'wait to return' and 'get clipboard' action to use the result.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "quickLookExtended": Action<QuickLookExtendedParameter>(name: "Preview", identifier: "com.alexhay.ToolboxProForShortcuts.QuickLookExtendedIntent", correctTypedFunction: "quickLookExtended", description: """
                                Given a list of images and text, this tool will display them in order in a window in Toolbox Pro. You can add interactive elements and formatting - check the tool description in the app for more details.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "checkForUpdates": Action<CheckForUpdatesParameter>(name: "Check RoutineHub For Updates", identifier: "com.alexhay.ToolboxProForShortcuts.CheckForUpdatesIntent", correctTypedFunction: "checkForUpdates", description: """
                                Check RoutineHub for updates.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "pickColour": Action<PickColourParameter>(name: "Pick Colour", identifier: "com.alexhay.ToolboxProForShortcuts.PickColourIntent", correctTypedFunction: "pickColour", description: """
                                Opens a colour selection interface in Toolbox Pro. You can optionally select a reference image to use the eye-dropper tool on and a hex code to use as a starting point. When finished, the hex code is copied to the clipboard and Shortcuts is re-opened. Add a 'Wait To Return' and 'Get Clipboard' action after this one to use the chosen hex code.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "sortList": Action<SortListParameter>(name: "Sort List", identifier: "com.alexhay.ToolboxProForShortcuts.SortListIntent", correctTypedFunction: "sortList", description: """
                                Sort a list of text and numbers.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "createRemindersList": Action<CreateRemindersListParameter>(name: "Create Reminders List", identifier: "com.alexhay.ToolboxProForShortcuts.CreateRemindersListIntent", correctTypedFunction: "createRemindersList", description: """
                                Create a list in reminders, you can use your own custom colour for the list.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "editEvent": Action<EditEventParameter>(name: "Edit Event", identifier: "com.alexhay.ToolboxProForShortcuts.EditEventIntent", correctTypedFunction: "editEvent", description: """
                                Edit the details of an event. Use the 'Get Event UUID' tool to grab the uniquer identifier for the event you wish to edit first.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "detectFaces": Action<DetectFacesParameter>(name: "Detect Faces", identifier: "com.alexhay.ToolboxProForShortcuts.DetectFacesIntent", correctTypedFunction: "detectFaces", description: """
                                Analyse an image to see if it contains faces
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "batteryStatus": Action<BatteryStatusParameter>(name: "Get Battery Status", identifier: "com.alexhay.ToolboxProForShortcuts.BatteryStatusIntent", correctTypedFunction: "batteryStatus", description: """
                                Check the charge status of your device's battery.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "analyseImage": Action<AnalyseImageParameter>(name: "Analyse Image", identifier: "com.alexhay.ToolboxProForShortcuts.AnalyseImageIntent", correctTypedFunction: "analyseImage", description: """
                                Use machine learning to analyse the contents of an image.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "isSilentModeOn": Action<IsSilentModeOnParameter>(name: "Is Silent Mode On", identifier: "com.alexhay.ToolboxProForShortcuts.IsSilentModeOnIntent", correctTypedFunction: "isSilentModeOn", description: """
                                Returns true if your device is currently muted
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "removeItemsFromList": Action<RemoveItemsFromListParameter>(name: "Remove From List", identifier: "com.alexhay.ToolboxProForShortcuts.RemoveItemsFromListIntent", correctTypedFunction: "removeItemsFromList", description: """
                                Remove items at the selected indexes or in a range from a list
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getWorkouts": Action<GetWorkoutsParameter>(name: "Get Workouts", identifier: "com.alexhay.ToolboxProForShortcuts.GetWorkoutsIntent", correctTypedFunction: "getWorkouts", description: """
                                Get workout data from Health
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getFileURL": Action<GetFileURLParameter>(name: "Get File URLs", identifier: "com.alexhay.ToolboxProForShortcuts.GetFileURLIntent", correctTypedFunction: "getFileURL", description: """
                                Get the URL for the chosen file or open Toolbox Pro and select a folder and copy its URL to the clipboard
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "formatCurrency": Action<FormatCurrencyParameter>(name: "Format Currency", identifier: "com.alexhay.ToolboxProForShortcuts.FormatCurrencyIntent", correctTypedFunction: "formatCurrency", description: """
                                Formate an amount to the chosen currency
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "editBookmarkedFile": Action<EditBookmarkedFileParameter>(name: "Edit Bookmarked File", identifier: "com.alexhay.ToolboxProForShortcuts.EditBookmarkedFileIntent", correctTypedFunction: "editBookmarkedFile", description: """
                                This action lets you easily prepend, append, overwrite or replace text in any bookmarked file or folder
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getAudio": Action<GetAudioParameter>(name: "Get Sound", identifier: "com.alexhay.ToolboxProForShortcuts.GetAudioIntent", correctTypedFunction: "getAudio", description: """
                                Choose a system sound to play in your shortcut. Add a "play sound" action after this one.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "formatDateExtended": Action<FormatDateExtendedParameter>(name: "Format Date (Extended)", identifier: "com.alexhay.ToolboxProForShortcuts.FormatDateExtendedIntent", correctTypedFunction: "formatDateExtended", description: """
                                Display the date in the selected format.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getMenuItem": Action<GetMenuItemParameter>(name: "Get Menu Item Details", identifier: "com.alexhay.ToolboxProForShortcuts.GetMenuItemIntent", correctTypedFunction: "getMenuItem", description: """
                                Get details from the chosen menu item.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "findBooks": Action<FindBooksParameter>(name: "Find Books", identifier: "com.alexhay.ToolboxProForShortcuts.FindBooksIntent", correctTypedFunction: "findBooks", description: """
                                Search for volumes on Google Books
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "performCalculation": Action<PerformCalculationParameter>(name: "Perform Calculation", identifier: "com.alexhay.ToolboxProForShortcuts.PerformCalculationIntent", correctTypedFunction: "performCalculation", description: """
                                Please use the 'Calculate With Soulver' action, this will be removed in a future update.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "trimText": Action<TrimTextParameter>(name: "Trim Text", identifier: "com.alexhay.ToolboxProForShortcuts.TrimTextIntent", correctTypedFunction: "trimText", description: """
                                Remove characters from the start or end of the given text. You can remove blank lines and leading or trailing tabs and spaces
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getDetailsOfLocation": Action<GetDetailsOfLocationParameter>(name: "Get Details Of Locations (Extended)", identifier: "com.alexhay.ToolboxProForShortcuts.GetDetailsOfLocationIntent", correctTypedFunction: "getDetailsOfLocation", description: """
                                Get more information about the given location.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "deleteFilesInBookmarkedFolder": Action<DeleteFilesInBookmarkedFolderParameter>(name: "Delete Files In Bookmarked Folder", identifier: "com.alexhay.ToolboxProForShortcuts.DeleteFilesInBookmarkedFolderIntent", correctTypedFunction: "deleteFilesInBookmarkedFolder", description: """
                                Trash files stored inside a bookmarked folder
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "seekPlayback": Action<SeekPlaybackParameter>(name: "Seek Playback", identifier: "com.alexhay.ToolboxProForShortcuts.SeekPlaybackIntent", correctTypedFunction: "seekPlayback", description: """
                                Set the playback to a certain time or skip forward or backwards the chosen number of seconds
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "quickMatchText": Action<QuickMatchTextParameter>(name: "Quick Match Text", identifier: "com.alexhay.ToolboxProForShortcuts.QuickMatchTextIntent", correctTypedFunction: "quickMatchText", description: """
                                Perform frequently used regex operations to find text.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "quickMenu": Action<QuickMenuParameter>(name: "Quick Menu", identifier: "com.alexhay.ToolboxProForShortcuts.QuickMenu2Intent", correctTypedFunction: "quickMenu", description: """
                                Create a menu using specially formatted text. Check the tool description in the Toolbox Pro app for the formatting. Add a Choose From List action after this one.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "findArtists": Action<FindArtistsParameter>(name: "Find Artists", identifier: "com.alexhay.ToolboxProForShortcuts.FindArtistsIntent", correctTypedFunction: "findArtists", description: """
                                Find artists in the Music catalogue
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "rateSongs": Action<RateSongsParameter>(name: "Rate Music", identifier: "com.alexhay.ToolboxProForShortcuts.RateSongsIntent", correctTypedFunction: "rateSongs", description: """
                                Rate or remove rating for the given Music track or album
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "checkIfInstalled": Action<CheckIfInstalledParameter>(name: "Check If App Is Installed", identifier: "com.alexhay.ToolboxProForShortcuts.CheckIfInstalledIntent", correctTypedFunction: "checkIfInstalled", description: """
                                Check whether these apps are installed on the device
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "detectQRImage": Action<DetectQRImageParameter>(name: "Scan QR Code In Image", identifier: "com.alexhay.ToolboxProForShortcuts.DetectQRImageIntent", correctTypedFunction: "detectQRImage", description: """
                                Get information from a QR code found in a static image
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "removeDuplicates": Action<RemoveDuplicatesParameter>(name: "Remove Duplicates", identifier: "com.alexhay.ToolboxProForShortcuts.RemoveDuplicatesIntent", correctTypedFunction: "removeDuplicates", description: """
                                Removes duplicate entries from a list
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "generateUUID": Action<GenerateUUIDParameter>(name: "Generate UUID", identifier: "com.alexhay.ToolboxProForShortcuts.GenerateUUIDIntent", correctTypedFunction: "generateUUID", description: """
                                Generate a unique identification number
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "addContact": Action<AddContactParameter>(name: "Add Contact", identifier: "com.alexhay.ToolboxProForShortcuts.AddContactIntent", correctTypedFunction: "addContact", description: """
                                Add a new contact to your address book
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "filterImage": Action<FilterImageParameter>(name: "Filter Images", identifier: "com.alexhay.ToolboxProForShortcuts.FilterImageIntent", correctTypedFunction: "filterImage", description: """
                                Apply a choice of filters to the selected images. The filtered images are copied to the clipboard in the Toolbox Pro app before returning to Shortcuts. It's best to add a "wait to return" and a "get contents of clipboard" action after this one.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "setNestedDictionaryValue": Action<SetNestedDictionaryValueParameter>(name: "Set Nested Dictionary Value", identifier: "com.alexhay.ToolboxProForShortcuts.SetNestedDictionaryValueIntent", correctTypedFunction: "setNestedDictionaryValue", description: """
                                Set or append a value to a nested dictionary using dot notation
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "filterImagesIAIH": Action<FilterImagesIAIHParameter>(name: "Filter Images", identifier: "com.alexhay.ToolboxProForShortcuts.FilterImagesIAIHIntent", correctTypedFunction: "filterImagesIAIH", description: """
                                Apply a filter to change the appearance of the given images. Filter can be: Chrome, Fade, Instant, Mono, Noir, Process, Tonal, Transfer.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getReminderID": Action<GetReminderIDParameter>(name: "Get Reminder UUID", identifier: "com.alexhay.ToolboxProForShortcuts.GetReminderIDIntent", correctTypedFunction: "getReminderID", description: """
                                Get the unique identifier of the selected reminder.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getRecentSongs": Action<GetRecentSongsParameter>(name: "Get Music history", identifier: "com.alexhay.ToolboxProForShortcuts.GetRecentSongsIntent", correctTypedFunction: "getRecentSongs", description: """
                                Get recently played songs, heavily rotated songs or recently added songs from Music
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "createQueryItem": Action<CreateQueryItemParameter>(name: "Create Query Item", identifier: "com.alexhay.ToolboxProForShortcuts.CreateQueryItemIntent", correctTypedFunction: "createQueryItem", description: """
                                Create a query item URL components which can be added to a URL using the Build URL tool. The name and value of a single query item can be entered manually or you can provide multiple names and values in a dictionary object: {"name1":"value1","name2":"value2"}
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "findSongs": Action<FindSongsParameter>(name: "Find Songs", identifier: "com.alexhay.ToolboxProForShortcuts.FindSongsIntent", correctTypedFunction: "findSongs", description: """
                                Search the Music catalogue for songs
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "editText": Action<EditTextParameter>(name: "Input Text", identifier: "com.alexhay.ToolboxProForShortcuts.EditTextIntent", correctTypedFunction: "editText", description: """
                                Open Toolbox Pro into a basic text editor. Use it to input text or edit the given text. The result is copied to the clipboard. Add a 'wait to return' and 'get contents of clipboard' after this one.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getActivity": Action<GetActivityParameter>(name: "Get Activity", identifier: "com.alexhay.ToolboxProForShortcuts.GetActivityIntent", correctTypedFunction: "getActivity", description: """
                                Get your daily Watch activity goal data from Health
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getTBPTools": Action<GetTBPToolsParameter>(name: "Get Toolbox Pro Tools", identifier: "com.alexhay.ToolboxProForShortcuts.GetTBPToolsIntent", correctTypedFunction: "getTBPTools", description: """
                                A meta tool to retrieve a list of all of Toolbox Pro's tools
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "recogniseSpeech": Action<RecogniseSpeechParameter>(name: "Get Text From Audio", identifier: "com.alexhay.ToolboxProForShortcuts.RecogniseSpeechIntent", correctTypedFunction: "recogniseSpeech", description: """
                                Analyse the audio file and transcribe any recognised speech, on-device.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getEventID": Action<GetEventIDParameter>(name: "Get Event UUID", identifier: "com.alexhay.ToolboxProForShortcuts.GetEventIDIntent", correctTypedFunction: "getEventID", description: """
                                Get the UUID (unique identifier) of a event in your calendar.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "formatNumberAsText": Action<FormatNumberAsTextParameter>(name: "Format Number As Text", identifier: "com.alexhay.ToolboxProForShortcuts.FormatNumberAsTextIntent", correctTypedFunction: "formatNumberAsText", description: """
                                Get the written form of the given number
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "deleteFromDictionary": Action<DeleteFromDictionaryParameter>(name: "Edit Dictionary", identifier: "com.alexhay.ToolboxProForShortcuts.DeleteFromDictionaryIntent", correctTypedFunction: "deleteFromDictionary", description: """
                                Delete key pairs from a dictionary or merge two dictionaries together.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "viewMap": Action<ViewMapParameter>(name: "View Map", identifier: "com.alexhay.ToolboxProForShortcuts.ViewMapIntent", correctTypedFunction: "viewMap", description: """
                                Display a customisable map view.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "editFolderBookmarks": Action<EditFolderBookmarksParameter>(name: "Edit Folder Bookmarks", identifier: "com.alexhay.ToolboxProForShortcuts.EditFolderBookmarksIntent", correctTypedFunction: "editFolderBookmarks", description: """
                                List and remove folder bookmarks. You can also retrieve a URL which will open the Bookmarked Folder directly in the Files app
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "getFromDictionary": Action<GetFromDictionaryParameter>(name: "Get Dictionary Values", identifier: "com.alexhay.ToolboxProForShortcuts.GetFromDictionaryIntent", correctTypedFunction: "getFromDictionary", description: """
                                Search dictionary and values for the matching keys.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "generateThumbnails": Action<GenerateThumbnailsParameter>(name: "Generate Thumbnails", identifier: "com.alexhay.ToolboxProForShortcuts.GenerateThumbnailsIntent", correctTypedFunction: "generateThumbnails", description: """
                                Generate icon or preview thumbnails from the given files or URLs
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "averageColour": Action<AverageColourParameter>(name: "Get Colours From Image", identifier: "com.alexhay.ToolboxProForShortcuts.AverageColourIntent", correctTypedFunction: "averageColour", description: """
                                Get the average or most prominent colours of an image.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "filterList": Action<FilterListParameter>(name: "Filter List", identifier: "com.alexhay.ToolboxProForShortcuts.FilterListIntent", correctTypedFunction: "filterList", description: """
                                Choose which items to discard or keep in a list of text or numbers.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),
  "findTvShows": Action<FindTvShowsParameter>(name: "Find TV Shows", identifier: "com.alexhay.ToolboxProForShortcuts.FindTvShowsIntent", correctTypedFunction: "findTvShows", description: """
                                Search TMDb for TV Shows matching your search criteria.
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),

    ]
}
