//
//  ShortcutsLookup.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

extension TranspilerLookupTables {
    static var WallpaperAppFunctions: [String : AnyAction] = [
  "getWallpaper": Action<GetWallpaperParameter>(name: "Get Wallpaper", identifier: "com.lumendigital.Wallpaper-App.GetWallpaperIntent", correctTypedFunction: "getWallpaper", description: """
                                Get a random wallpaper
                                """, lowestCompatibleHost: .iOS14, presets: [
                                    
                                ]),

    ]
}