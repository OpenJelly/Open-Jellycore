//
//  Jelly_WFContentItemPropertyName.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFContentItemPropertyName: String, JellyEnum, Codable {
    case Folder
    case Icon
    case ActionCount
    case FileSize
    case FileExtension
    case CreationDate
    case LastModifiedDate
    case URL
    case Name
    case Body
    case Date
    case Location
    case Temperature
    case High
    case Low
    case FeelsLike
    case Condition
    case Visibility
    case Dewpoint
    case Humidity
    case Pressure
    case PrecipitationAmount
    case PrecipitationChance
    case WindSpeed
    case WindDirection
    case UVIndex
    case SunriseTime
    case SunsetTime
    case AirQualityIndex
    case AirQualityCategory
    case AirPollutants
    case Price
    case ChangeinPrice
    case OpenPrice
    case LowPrice
    case HighPrice
    case fiftytwoWeekLow
    case fiftytwoWeekHigh
    case TimeQuoteWasLastUpdated
    case InfoURL
    case CompanyName
    case Currency
    case AppleMusicID
    case Artist
    case Title
    case ISExplicit
    case LyricsSnippet
    case LyricSnippetSynced
    case Artwork
    case VideoURL
    case ShazamURL
    case AppleMusicURL
    case PageContents
    case PageSelection
    case PageURL
    case Notes
    case DueDate
    case Priority
    case IsCompleted
    case IsFlagged
    case List
    case Image
    case HasSubtasks
    case Subtasks
    case ParentReminder
    case HasAlarms
    case ReminderLocation
    case VehicleInformation
    case DropOffTime
    case PickupTime
    case PickupLocation
    case DropOffLocation
    case MinimumPrice
    case MaximumPrice
    case RideOptionName
    case Driver
    case FeedURL
    case Genre
    case EpisodeCount
    case StoreID
    case StoreURL
    case ArtworkURL
    case Author
    case Description
    case Genres
    case Duration
    case Album
    case Composer
    case DateAdded
    case MediaKind
    case PlayCount
    case AlbumTrack
    case Disc
    case AlbumArtwork
    case Lyrics
    case ReleaseDate
    case Comments
    case IsCloudItem
    case SkipCount
    case LastPlayedDate
    case Rating
    case Latitude
    case Longitude
    case Altitude
    case Street
    case City
    case State
    case ZipCode
    case Region
    case PhoneNumber
    case CurrencyCode
    case FormattedPrice
    case IsStreamable
    case Width
    case Height
    case DateTaken
    case MediaType
    case PhotoType
    case IsaScreenshot
    case FrameRate
    case Orientation
    case CameraMake
    case CameraModel
    case MetadataDictionary
    case IsHidden
    case IsFavorite
    case `Type`
    case Value
    case Unit
    case StartDate
    case EndDate
    case Source
    case Status
    case Role
    case IsMe
    case FirstName
    case MiddleName
    case LastName
    case EmailAddress
    case StreetAddress
    case Birthday
    case ContactPhoto
    case Prefix
    case Suffix
    case Nickname
    case PhoneticFirstName
    case PhoneticLastName
    case PhoneticMiddleName
    case Company
    case JobTitle
    case Department
    case Organizer
    case Excerpt
    case NumberOfWords
    case MainImageURL
    case Category
    case ofRatings
    case RatingThisVersion
    case ofRatingsThisVersion
    case Version
    case ReleaseNotes
    case ContentRating
    case MinimumOSVersion
    case IsUniversal
    case SupportsGameCenter
    case SupportedDevices
    case SupportedLanguages
    case ScreenshotURLs
    case iPadScreenshotURLs
    case DownloadSize
    case DarkModeIsOn
    case InverseAppearance


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
        case .Folder:
            return "Folder"
        case .Icon:
            return "Icon"
        case .ActionCount:
            return "Action Count"
        case .FileSize:
            return "File Size"
        case .FileExtension:
            return "File Extension"
        case .CreationDate:
            return "Creation Date"
        case .LastModifiedDate:
            return "Last Modified Date"
        case .URL:
            return "URL"
        case .Name:
            return "Name"
        case .Body:
            return "Body"
        case .Date:
            return "Date"
        case .Location:
            return "Location"
        case .Temperature:
            return "Temperature"
        case .High:
            return "High"
        case .Low:
            return "Low"
        case .FeelsLike:
            return "Feels Like"
        case .Condition:
            return "Condition"
        case .Visibility:
            return "Visibility"
        case .Dewpoint:
            return "Dewpoint"
        case .Humidity:
            return "Humidity"
        case .Pressure:
            return "Pressure"
        case .PrecipitationAmount:
            return "Precipitation Amount"
        case .PrecipitationChance:
            return "Precipitation Chance"
        case .WindSpeed:
            return "Wind Speed"
        case .WindDirection:
            return "Wind Direction"
        case .UVIndex:
            return "UV Index"
        case .SunriseTime:
            return "Sunrise Time"
        case .SunsetTime:
            return "Sunset Time"
        case .AirQualityIndex:
            return "Air Quality Index"
        case .AirQualityCategory:
            return "Air Quality Category"
        case .AirPollutants:
            return "Air Pollutants"
        case .Price:
            return "Price"
        case .ChangeinPrice:
            return "Change in Price"
        case .OpenPrice:
            return "Open Price"
        case .LowPrice:
            return "Low Price"
        case .HighPrice:
            return "High Price"
        case .fiftytwoWeekLow:
            return "52-Week Low"
        case .fiftytwoWeekHigh:
            return "52-Week High"
        case .TimeQuoteWasLastUpdated:
            return "Time Quote Was Last Updated"
        case .InfoURL:
            return "Info URL"
        case .CompanyName:
            return "Company Name"
        case .Currency:
            return "Currency"
        case .AppleMusicID:
            return "Apple Music ID"
        case .Artist:
            return "Artist"
        case .Title:
            return "Title"
        case .ISExplicit:
            return "IS Explicit"
        case .LyricsSnippet:
            return "Lyrics Snippet"
        case .LyricSnippetSynced:
            return "Lyric Snippet Synced"
        case .Artwork:
            return "Artwork"
        case .VideoURL:
            return "Video URL"
        case .ShazamURL:
            return "Shazam URL"
        case .AppleMusicURL:
            return "Apple Music URL"
        case .PageContents:
            return "Page Contents"
        case .PageSelection:
            return "Page Selection"
        case .PageURL:
            return "Page URL"
        case .Notes:
            return "Notes"
        case .DueDate:
            return "Due Date"
        case .Priority:
            return "Priority"
        case .IsCompleted:
            return "Is Completed"
        case .IsFlagged:
            return "Is Flagged"
        case .List:
            return "List"
        case .Image:
            return "Image"
        case .HasSubtasks:
            return "Has Subtasks"
        case .Subtasks:
            return "Subtasks"
        case .ParentReminder:
            return "Parent Reminder"
        case .HasAlarms:
            return "Has Alarms"
        case .ReminderLocation:
            return "Reminder Location"
        case .VehicleInformation:
            return "Vehicle Information"
        case .DropOffTime:
            return "Drop Off Time"
        case .PickupTime:
            return "Pickup Time"
        case .PickupLocation:
            return "Pickup Location"
        case .DropOffLocation:
            return "Drop Off Location"
        case .MinimumPrice:
            return "Minimum Price"
        case .MaximumPrice:
            return "Maximum Price"
        case .RideOptionName:
            return "Ride Option Name"
        case .Driver:
            return "Driver"
        case .FeedURL:
            return "Feed URL"
        case .Genre:
            return "Genre"
        case .EpisodeCount:
            return "Episode Count"
        case .StoreID:
            return "Store ID"
        case .StoreURL:
            return "Store URL"
        case .ArtworkURL:
            return "Artwork URL"
        case .Author:
            return "Author"
        case .Description:
            return "Description"
        case .Genres:
            return "Genres"
        case .Duration:
            return "Duration"
        case .Album:
            return "Album"
        case .Composer:
            return "Composer"
        case .DateAdded:
            return "Date Added"
        case .MediaKind:
            return "Media Kind"
        case .PlayCount:
            return "Play Count"
        case .AlbumTrack:
            return "Album Track #"
        case .Disc:
            return "Disc #"
        case .AlbumArtwork:
            return "Album Artwork"
        case .Lyrics:
            return "Lyrics"
        case .ReleaseDate:
            return "Release Date"
        case .Comments:
            return "Comments"
        case .IsCloudItem:
            return "Is Cloud Item"
        case .SkipCount:
            return "Skip Count"
        case .LastPlayedDate:
            return "Last Played Date"
        case .Rating:
            return "Rating"
        case .Latitude:
            return "Latitude"
        case .Longitude:
            return "Longitude"
        case .Altitude:
            return "Altitude"
        case .Street:
            return "Street"
        case .City:
            return "City"
        case .State:
            return "State"
        case .ZipCode:
            return "Zip Code"
        case .Region:
            return "Region"
        case .PhoneNumber:
            return "Phone Number"
        case .CurrencyCode:
            return "Currency Code"
        case .FormattedPrice:
            return "Formatted Price"
        case .IsStreamable:
            return "Is Streamable"
        case .Width:
            return "Width"
        case .Height:
            return "Height"
        case .DateTaken:
            return "Date Taken"
        case .MediaType:
            return "Media Type"
        case .PhotoType:
            return "Photo Type"
        case .IsaScreenshot:
            return "Is a Screenshot"
        case .FrameRate:
            return "Frame Rate"
        case .Orientation:
            return "Orientation"
        case .CameraMake:
            return "Camera Make"
        case .CameraModel:
            return "Camera Model"
        case .MetadataDictionary:
            return "Metadata Dictionary"
        case .IsHidden:
            return "Is Hidden"
        case .IsFavorite:
            return "Is Favorite"
        case .Type:
            return "Type"
        case .Value:
            return "Value"
        case .Unit:
            return "Unit"
        case .StartDate:
            return "Start Date"
        case .EndDate:
            return "End Date"
        case .Source:
            return "Source"
        case .Status:
            return "Status"
        case .Role:
            return "Role"
        case .IsMe:
            return "Is Me"
        case .FirstName:
            return "First Name"
        case .MiddleName:
            return "Middle Name"
        case .LastName:
            return "Last Name"
        case .EmailAddress:
            return "Email Address"
        case .StreetAddress:
            return "Street Address"
        case .Birthday:
            return "Birthday"
        case .ContactPhoto:
            return "Contact Photo"
        case .Prefix:
            return "Prefix"
        case .Suffix:
            return "Suffix"
        case .Nickname:
            return "Nickname"
        case .PhoneticFirstName:
            return "Phonetic First Name"
        case .PhoneticLastName:
            return "Phonetic Last Name"
        case .PhoneticMiddleName:
            return "Phonetic Middle Name"
        case .Company:
            return "Company"
        case .JobTitle:
            return "Job Title"
        case .Department:
            return "Department"
        case .Organizer:
            return "Organizer"
        case .Excerpt:
            return "Excerpt"
        case .NumberOfWords:
            return "Number Of Words"
        case .MainImageURL:
            return "Main Image URL"
        case .Category:
            return "Category"
        case .ofRatings:
            return "# of Ratings"
        case .RatingThisVersion:
            return "Rating (This Version)"
        case .ofRatingsThisVersion:
            return "# of Ratings (This Version)"
        case .Version:
            return "Version"
        case .ReleaseNotes:
            return "Release Notes"
        case .ContentRating:
            return "Content Rating"
        case .MinimumOSVersion:
            return "Minimum OS Version"
        case .IsUniversal:
            return "Is Universal"
        case .SupportsGameCenter:
            return "Supports Game Center"
        case .SupportedDevices:
            return "Supported Devices"
        case .SupportedLanguages:
            return "Supported Languages"
        case .ScreenshotURLs:
            return "Screenshot URLs"
        case .iPadScreenshotURLs:
            return "iPad Screenshot URLs"
        case .DownloadSize:
            return "Download Size"
        case .DarkModeIsOn:
            return "Dark Mode Is On"
        case .InverseAppearance:
            return "Inverse Appearance"

        }
    }
}

extension Jelly_WFContentItemPropertyName {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
