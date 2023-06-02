//
//  Images & Icons.swift
//  
//
//  Created by Taylor Lineman on 1/7/23.
//

public enum ShortcutColor: String, CaseIterable, Identifiable {
    case red
    case orange
    case tangerine
    case yellow
    case green
    case teal
    case lightBlue
    case blue
    case navy
    case grape
    case purple
    case pink
    case grayBlue
    case grayGreen
    case grayBrown
    
    public var version: ShortcutsHostVersion {
        switch self {
        case .red:
            return .iOS13
        case .orange:
            return .iOS13
        case .tangerine:
            return .iOS13
        case .yellow:
            return .iOS13
        case .green:
            return .iOS13
        case .teal:
            return .iOS13
        case .lightBlue:
            return .iOS13
        case .blue:
            return .iOS13
        case .navy:
            return .iOS13
        case .grape:
            return .iOS13
        case .purple:
            return .iOS13
        case .pink:
            return .iOS13
        case .grayBlue:
            return .iOS13
        case .grayGreen:
            return .iOS13
        case .grayBrown:
            return .iOS13
        }
    }
    
    public var id: Int {
        switch self {
        case .red:
            return 4282601983
        case .orange:
            return 4251333119
        case .tangerine:
            return 4271458815
        case .yellow:
            return 4274264319
        case .green:
            return 4292093695
        case .teal:
            return 431817727
        case .lightBlue:
            return 1440408063
        case .blue:
            return 463140863
        case .navy:
            return 946986751
        case .grape:
            return 2071128575
        case .purple:
            return 3679049983
        case .pink:
            return 3980825855
        case .grayBlue:
            return 255
        case .grayGreen:
            return 3031607807
        case .grayBrown:
            return 2846468607
        }
    }
    
    public var gradient: (top: String, bottom: String) {
        switch self {
        case .red:
            return ("#F36F74", "#F2585E")
        case .orange:
            return ("#FF8E73", "#FF7C5C")
        case .tangerine:
            return ("#F8AE5F", "#F7A145")
        case .yellow:
            return ("#E8CA45", "#E5C238")
        case .green:
            return ("#53CD6B", "#37C553")
        case .teal:
            return ("#57CFB4", "#2AC7A8")
        case .lightBlue:
            return ("#5ACCDE", "#3FC4D9")
        case .blue:
            return ("#24BAF7", "#00AFF6")
        case .navy:
            return ("#5874CA", "#3D5EC2")
        case .grape:
            return ("#9164C7", "#7F4BBE")
        case .purple:
            return ("#C085E6", "#B671E2")
        case .pink:
            return ("#F694D8", "#F583D2")
        case .grayBlue:
            return ("9099A3", "#7E8994")
        case .grayGreen:
            return ("#9DA79D", "#8D998E")
        case .grayBrown:
            return ("#A49995", "#968984")
        }
    }
}

public enum ShortcutGlyph: String, CaseIterable, Identifiable {
    case car
    case carMultiple
    case electricCar
    case bus
    case busDouble
    case tram
    case tramTunnel
    case bike
    case motorcycle
    case ambulance
    case airplane
    case sailboat
    case house
    case church
    case buildings
    case shoppingCart
    case handbag
    case groceryStore
    case utensils
    case fuelstation
    case thermometer
    case sun
    case moon
    case moonCircle
    case snowflake
    case cloud
    case raincloud
    case umbrella
    case pineTree
    case flower
    case fire
    case footprints
    case signs
    case binoculars
    case compass
    case globe
    case mountain
    case picture
    case filmstrip
    case camera
    case movieCamera
    case microphone
    case videoIcon
    case clipboard
    case calendar
    case chatBubble
    case messageBubbles
    case textBubble
    case envelope
    case envelopeOpen
    case paperAirplane
    case paperAirplaneCircle
    case briefcase
    case folder
    case creditCard
    case watch
    case phone
    case laptop
    case keyboard
    case keyboardOld
    case calculator
    case barGraph
    case printer
    case hardDrive
    case server
    case database
    case networkStorage
    case archive
    case cube
    case tv
    case gameController
    case puzzlePiece
    case headphones
    case headphonesCircle
    case ear
    case musicNote
    case speakerWave1
    case speakerWave2
    case speakerWave3
    case mute
    case speaker
    case hifiSpeaker
    case desktopSpeaker
    case bookshelf
    case openBook
    case sashBook
    case closedBook
    case glasses
    case mask
    case ticket
    case dramaMask
    case dice
    case baseball
    case basketball
    case soccerBall
    case tennisBall
    case football
    case lifePreserver
    case telescope
    case microscope
    case horse
    case clock
    case alarmClock
    case stopwatch
    case bell
    case sparklingBell
    case heart
    case star
    case trophy
    case lightbulb
    case lightningBolt
    case flag
    case tag
    case key
    case hourglass
    case lock
    case unlockButton
    case battery
    case magicWand
    case magicWandAlt
    case paintbrush
    case pencil
    case paperclip
    case scissors
    case magnifyingGlass
    case chainlink
    case eyedropper
    case hammer
    case wrench
    case tools
    case gear
    case hammerAlt
    case screwdriver
    case hand
    case trashcan
    case waterDrop
    case mug
    case steamingBowl
    case apple
    case carrot
    case fish
    case cake
    case wineBottle
    case martini
    case clothesHanger
    case laundryMachine
    case oven
    case shirt
    case bathtub
    case shower
    case pill
    case medicine
    case medicineBottle
    case bandage
    case inhaler
    case stethoscope
    case syringe
    case atom
    case chemical
    case cat
    case dog
    case pawPrint
    case thumbsUp
    case graduate
    case gift
    case alien
    case bed
    case stairs
    case rocket
    case map
    case gauge
    case speedometer
    case barometer
    case network
    case rectangleStack
    case squareStack
    case threeDSquareStack = "3DSquareStack"
    case photoStack
    case photoStackAlt
    case aperture
    case note
    case noteText
    case noteTextPlus
    case sendMessage
    case addMessage
    case earPods
    case airPods
    case airPodsPro
    case radio
    case appleTV
    case homePod
    case appleWatchWaves
    case iPhone
    case iPhoneWave
    case iPhoneApps
    case iPad
    case iPadAlt
    case iPod
    case babyGirl
    case babyBoy
    case child
    case man
    case woman
    case wheelchair
    case person
    case people2
    case people3
    case person2
    case personAlter
    case personSpeech
    case personDancer
    case personLifting
    case personSkiing
    case personSnowboarding
    case personSwimming
    case personHiking
    case personWalking
    case personWalkingCane
    case personRunning
    case personRunningCircle
    case personSprinting
    case personClose
    case personOpen
    case shortcuts
    case alertTriangle
    case arrowCurvedLeft
    case arrowCurvedRight
    case bookmark
    case barcode
    case QRCode
    case play
    case boxFilled
    case boxOutline
    case braille
    case circleLeftArrow
    case circleRightArrow
    case downloadArrow
    case circledUpArrow
    case circledDownArrow
    case uploadArrow
    case circledPlay
    case circledRewind
    case circledPower
    case circledStop
    case circledFastForward
    case circledQuestionMark
    case circledCheckmark
    case circledPlus
    case circledX
    case circledPi
    case circledI
    case smileyFace
    case document
    case dollarSign
    case poundSign
    case euroSign
    case yenSign
    case bitcoin
    case asterisk
    case documentFilled
    case documentOutline
    case newsArticle
    case fourSquares
    case ellipsis
    case list
    case twelveSquares
    case Connected
    case infinity
    case recycle
    case loadingIndicator
    case loadingIndicatorAlt
    case Target
    case podcasts
    case targetAlt
    case locationArrow
    case locationPin
    case parking
    case crop
    case shrinkArrow
    case moveArrow
    case repostArrows
    case syncArrows
    case shuffleArrows
    case sliders
    case doubleQuote
    case peaceSign
    case threeCircles
    case textSymbol
    case feedRight
    case feed
    case wifi
    case airdrop
    case arrowDiamond
    case directionsRight
    case airplayAudio
    case airplayVideo
    case musicNoteList
    case musicNoteAlt
    case musicSquareStack
    case musicWaveForm
    case livePlay
    case livePhoto
    case sloMo
    case timeLapse
    case calendarPlus
    case calendarExclamation
    case timer
    case timerSquare
    case compose
    case duplicate
    case nightShift
    case trueTone
    case dialMin
    case dialMax
    case QRViewFinder
    case cameraViewFinder
    case walletPass
    case appearance
    case noSign
    case command
    case commandCircle
    case commandSquare
    case blank
    case bumps
    case stripe
    case facetime
    case circledHeart
    case documentOutlineAlt
    case circledA
    case folderGear
    case folderOutline
    case takeout
    case starHalf
    case sparkles
    case surgicalMask
    case bear
    case tiger
    case monkey
    case ram
    case rabbit
    case snake
    case chicken
    case pig
    case mouse
    case cow
    case dragon
    case retroAlien
    case robot
    case ghost
    case poop
    case skull
    case twoxTwoRectangles = "2x2Rectangles"
    case twoxTwoRectanglesOutline = "2x2RectanglesOutline"
    case rectangleSplit
    case rectangleSplitThree
    case rectangleSplitThreeOutline
    case sendMessageOutline
    case brainHead
    case brain
    case faceGrinning
    case faceSmiling
    case faceGrinningSquint
    case faceTears
    case faceRolling
    case faceWink
    case faceGrimacing
    case faceLove
    case faceKiss
    case faceHearts
    case faceSunglasses
    case faceStarry
    case memoji
    case handSlash
    case handSlashOutline
    case thumbsUpEmoji
    case peace
    case loveGesture
    case closedFist
    case xSquare
    case checklist
    case doubleQuoteOutline
    case textBox
    case waveform
    case oneProngPuzzlePiece
    case cartoonHeart
    case twoCartoonHearts
    case cloudService

    public var version: ShortcutsHostVersion {
        switch self {
        case .car:
            return.iOS14
        case .carMultiple:
            return.iOS14
        case .electricCar:
            return.iOS14
        case .bus:
            return.iOS14
        case .busDouble:
            return.iOS14
        case .tram:
            return.iOS14
        case .tramTunnel:
            return.iOS14
        case .bike:
            return.iOS14
        case .motorcycle:
            return.iOS14
        case .ambulance:
            return.iOS14
        case .airplane:
            return.iOS14
        case .sailboat:
            return.iOS14
        case .house:
            return.iOS14
        case .church:
            return.iOS14
        case .buildings:
            return.iOS14
        case .shoppingCart:
            return.iOS14
        case .handbag:
            return.iOS14
        case .groceryStore:
            return.iOS14
        case .utensils:
            return.iOS14
        case .fuelstation:
            return.iOS14
        case .thermometer:
            return.iOS14
        case .sun:
            return.iOS14
        case .moon:
            return.iOS14
        case .moonCircle:
            return.iOS14
        case .snowflake:
            return.iOS14
        case .cloud:
            return.iOS14
        case .raincloud:
            return.iOS14
        case .umbrella:
            return.iOS14
        case .pineTree:
            return.iOS14
        case .flower:
            return.iOS14
        case .fire:
            return.iOS14
        case .footprints:
            return.iOS14
        case .signs:
            return.iOS14
        case .binoculars:
            return.iOS14
        case .compass:
            return.iOS14
        case .globe:
            return.iOS14
        case .mountain:
            return.iOS14
        case .picture:
            return.iOS14
        case .filmstrip:
            return.iOS14
        case .camera:
            return.iOS14
        case .movieCamera:
            return.iOS14
        case .microphone:
            return.iOS14
        case .videoIcon:
            return.iOS14
        case .clipboard:
            return.iOS14
        case .calendar:
            return.iOS14
        case .chatBubble:
            return.iOS14
        case .messageBubbles:
            return.iOS14
        case .textBubble:
            return.iOS14
        case .envelope:
            return.iOS14
        case .envelopeOpen:
            return.iOS14
        case .paperAirplane:
            return.iOS14
        case .paperAirplaneCircle:
            return.iOS14
        case .briefcase:
            return.iOS14
        case .folder:
            return.iOS14
        case .creditCard:
            return.iOS14
        case .watch:
            return.iOS14
        case .phone:
            return.iOS14
        case .laptop:
            return.iOS14
        case .keyboard:
            return.iOS14
        case .keyboardOld:
            return.iOS14
        case .calculator:
            return.iOS14
        case .barGraph:
            return.iOS14
        case .printer:
            return.iOS14
        case .hardDrive:
            return.iOS14
        case .server:
            return.iOS14
        case .database:
            return.iOS14
        case .networkStorage:
            return.iOS14
        case .archive:
            return.iOS14
        case .cube:
            return.iOS14
        case .tv:
            return.iOS14
        case .gameController:
            return.iOS14
        case .puzzlePiece:
            return.iOS14
        case .headphones:
            return.iOS14
        case .headphonesCircle:
            return.iOS14
        case .ear:
            return.iOS14
        case .musicNote:
            return.iOS14
        case .speakerWave1:
            return.iOS14
        case .speakerWave2:
            return.iOS14
        case .speakerWave3:
            return.iOS14
        case .mute:
            return.iOS14
        case .speaker:
            return.iOS14
        case .hifiSpeaker:
            return.iOS14
        case .desktopSpeaker:
            return.iOS14
        case .bookshelf:
            return.iOS14
        case .openBook:
            return.iOS14
        case .sashBook:
            return.iOS14
        case .closedBook:
            return.iOS14
        case .glasses:
            return.iOS14
        case .mask:
            return.iOS14
        case .ticket:
            return.iOS14
        case .dramaMask:
            return.iOS14
        case .dice:
            return.iOS14
        case .baseball:
            return.iOS14
        case .basketball:
            return.iOS14
        case .soccerBall:
            return.iOS14
        case .tennisBall:
            return.iOS14
        case .football:
            return.iOS14
        case .lifePreserver:
            return.iOS14
        case .telescope:
            return.iOS14
        case .microscope:
            return.iOS14
        case .horse:
            return.iOS14
        case .clock:
            return.iOS14
        case .alarmClock:
            return.iOS14
        case .stopwatch:
            return.iOS14
        case .bell:
            return.iOS14
        case .sparklingBell:
            return.iOS14
        case .heart:
            return.iOS14
        case .star:
            return.iOS14
        case .trophy:
            return.iOS14
        case .lightbulb:
            return.iOS14
        case .lightningBolt:
            return.iOS14
        case .flag:
            return.iOS14
        case .tag:
            return.iOS14
        case .key:
            return.iOS14
        case .hourglass:
            return.iOS14
        case .lock:
            return.iOS14
        case .unlockButton:
            return.iOS14
        case .battery:
            return.iOS14
        case .magicWand:
            return.iOS14
        case .magicWandAlt:
            return.iOS14
        case .paintbrush:
            return.iOS14
        case .pencil:
            return.iOS14
        case .paperclip:
            return.iOS14
        case .scissors:
            return.iOS14
        case .magnifyingGlass:
            return.iOS14
        case .chainlink:
            return.iOS14
        case .eyedropper:
            return.iOS14
        case .hammer:
            return.iOS14
        case .wrench:
            return.iOS14
        case .tools:
            return.iOS14
        case .gear:
            return.iOS14
        case .hammerAlt:
            return.iOS14
        case .screwdriver:
            return.iOS14
        case .hand:
            return.iOS14
        case .trashcan:
            return.iOS14
        case .waterDrop:
            return.iOS14
        case .mug:
            return.iOS14
        case .steamingBowl:
            return.iOS14
        case .apple:
            return.iOS14
        case .carrot:
            return.iOS14
        case .fish:
            return.iOS14
        case .cake:
            return.iOS14
        case .wineBottle:
            return.iOS14
        case .martini:
            return.iOS14
        case .clothesHanger:
            return.iOS14
        case .laundryMachine:
            return.iOS14
        case .oven:
            return.iOS14
        case .shirt:
            return.iOS14
        case .bathtub:
            return.iOS14
        case .shower:
            return.iOS14
        case .pill:
            return.iOS14
        case .medicine:
            return.iOS14
        case .medicineBottle:
            return.iOS14
        case .bandage:
            return.iOS14
        case .inhaler:
            return.iOS14
        case .stethoscope:
            return.iOS14
        case .syringe:
            return.iOS14
        case .atom:
            return.iOS14
        case .chemical:
            return.iOS14
        case .cat:
            return.iOS14
        case .dog:
            return.iOS14
        case .pawPrint:
            return.iOS14
        case .thumbsUp:
            return.iOS14
        case .graduate:
            return.iOS14
        case .gift:
            return.iOS14
        case .alien:
            return.iOS14
        case .bed:
            return.iOS14
        case .stairs:
            return.iOS14
        case .rocket:
            return.iOS14
        case .map:
            return.iOS14
        case .gauge:
            return.iOS14
        case .speedometer:
            return.iOS14
        case .barometer:
            return.iOS14
        case .network:
            return.iOS14
        case .rectangleStack:
            return.iOS14
        case .squareStack:
            return.iOS14
        case .threeDSquareStack:
            return.iOS14
        case .photoStack:
            return.iOS14
        case .photoStackAlt:
            return.iOS14
        case .aperture:
            return.iOS14
        case .note:
            return.iOS14
        case .noteText:
            return.iOS14
        case .noteTextPlus:
            return.iOS14
        case .sendMessage:
            return.iOS14
        case .addMessage:
            return.iOS14
        case .earPods:
            return.iOS14
        case .airPods:
            return.iOS14
        case .airPodsPro:
            return.iOS14
        case .radio:
            return.iOS14
        case .appleTV:
            return.iOS14
        case .homePod:
            return.iOS14
        case .appleWatchWaves:
            return.iOS14
        case .iPhone:
            return.iOS14
        case .iPhoneWave:
            return.iOS14
        case .iPhoneApps:
            return.iOS14
        case .iPad:
            return.iOS14
        case .iPadAlt:
            return.iOS14
        case .iPod:
            return.iOS14
        case .babyGirl:
            return.iOS14
        case .babyBoy:
            return.iOS14
        case .child:
            return.iOS14
        case .man:
            return.iOS14
        case .woman:
            return.iOS14
        case .wheelchair:
            return.iOS14
        case .person:
            return.iOS14
        case .people2:
            return.iOS14
        case .people3:
            return.iOS14
        case .person2:
            return.iOS14
        case .personAlter:
            return.iOS14
        case .personSpeech:
            return.iOS14
        case .personDancer:
            return.iOS14
        case .personLifting:
            return.iOS14
        case .personSkiing:
            return.iOS14
        case .personSnowboarding:
            return.iOS14
        case .personSwimming:
            return.iOS14
        case .personHiking:
            return.iOS14
        case .personWalking:
            return.iOS14
        case .personWalkingCane:
            return.iOS14
        case .personRunning:
            return.iOS14
        case .personRunningCircle:
            return.iOS14
        case .personSprinting:
            return.iOS14
        case .personClose:
            return.iOS14
        case .personOpen:
            return.iOS14
        case .shortcuts:
            return.iOS14
        case .alertTriangle:
            return.iOS14
        case .arrowCurvedLeft:
            return.iOS14
        case .arrowCurvedRight:
            return.iOS14
        case .bookmark:
            return.iOS14
        case .barcode:
            return.iOS14
        case .QRCode:
            return.iOS14
        case .play:
            return.iOS14
        case .boxFilled:
            return.iOS14
        case .boxOutline:
            return.iOS14
        case .braille:
            return.iOS14
        case .circleLeftArrow:
            return.iOS14
        case .circleRightArrow:
            return.iOS14
        case .downloadArrow:
            return.iOS14
        case .circledUpArrow:
            return.iOS14
        case .circledDownArrow:
            return.iOS14
        case .uploadArrow:
            return.iOS14
        case .circledPlay:
            return.iOS14
        case .circledRewind:
            return.iOS14
        case .circledPower:
            return.iOS14
        case .circledStop:
            return.iOS14
        case .circledFastForward:
            return.iOS14
        case .circledQuestionMark:
            return.iOS14
        case .circledCheckmark:
            return.iOS14
        case .circledPlus:
            return.iOS14
        case .circledX:
            return.iOS14
        case .circledPi:
            return.iOS14
        case .circledI:
            return.iOS14
        case .smileyFace:
            return.iOS14
        case .document:
            return.iOS14
        case .dollarSign:
            return.iOS14
        case .poundSign:
            return.iOS14
        case .euroSign:
            return.iOS14
        case .yenSign:
            return.iOS14
        case .bitcoin:
            return.iOS14
        case .asterisk:
            return.iOS14
        case .documentFilled:
            return.iOS14
        case .documentOutline:
            return.iOS14
        case .newsArticle:
            return.iOS14
        case .fourSquares:
            return.iOS14
        case .ellipsis:
            return.iOS14
        case .list:
            return.iOS14
        case .twelveSquares:
            return.iOS14
        case .Connected:
            return.iOS14
        case .infinity:
            return.iOS14
        case .recycle:
            return.iOS14
        case .loadingIndicator:
            return.iOS14
        case .loadingIndicatorAlt:
            return.iOS14
        case .Target:
            return.iOS14
        case .podcasts:
            return.iOS14
        case .targetAlt:
            return.iOS14
        case .locationArrow:
            return.iOS14
        case .locationPin:
            return.iOS14
        case .parking:
            return.iOS14
        case .crop:
            return.iOS14
        case .shrinkArrow:
            return.iOS14
        case .moveArrow:
            return.iOS14
        case .repostArrows:
            return.iOS14
        case .syncArrows:
            return.iOS14
        case .shuffleArrows:
            return.iOS14
        case .sliders:
            return.iOS14
        case .doubleQuote:
            return.iOS14
        case .peaceSign:
            return.iOS14
        case .threeCircles:
            return.iOS14
        case .textSymbol:
            return.iOS14
        case .feedRight:
            return.iOS14
        case .feed:
            return.iOS14
        case .wifi:
            return.iOS14
        case .airdrop:
            return.iOS14
        case .arrowDiamond:
            return.iOS14
        case .directionsRight:
            return.iOS14
        case .airplayAudio:
            return.iOS14
        case .airplayVideo:
            return.iOS14
        case .musicNoteList:
            return.iOS14
        case .musicNoteAlt:
            return.iOS14
        case .musicSquareStack:
            return.iOS14
        case .musicWaveForm:
            return.iOS14
        case .livePlay:
            return.iOS14
        case .livePhoto:
            return.iOS14
        case .sloMo:
            return.iOS14
        case .timeLapse:
            return.iOS14
        case .calendarPlus:
            return.iOS14
        case .calendarExclamation:
            return.iOS14
        case .timer:
            return.iOS14
        case .timerSquare:
            return.iOS14
        case .compose:
            return.iOS14
        case .duplicate:
            return.iOS14
        case .nightShift:
            return.iOS14
        case .trueTone:
            return.iOS14
        case .dialMin:
            return.iOS14
        case .dialMax:
            return.iOS14
        case .QRViewFinder:
            return.iOS14
        case .cameraViewFinder:
            return.iOS14
        case .walletPass:
            return.iOS14
        case .appearance:
            return.iOS14
        case .noSign:
            return.iOS14
        case .command:
            return.iOS14
        case .commandCircle:
            return.iOS14
        case .commandSquare:
            return.iOS14
        case .blank:
            return.iOS14
        case .bumps:
            return.iOS14
        case .stripe:
            return.iOS14
        case .facetime:
            return.iOS14
        case .circledHeart:
            return.iOS14
        case .documentOutlineAlt:
            return.iOS14
        case .circledA:
            return.iOS14
        case .folderGear:
            return.iOS15
        case .folderOutline:
            return.iOS15
        case .takeout:
            return.iOS15
        case .starHalf:
            return.iOS15
        case .sparkles:
            return.iOS15
        case .surgicalMask:
            return.iOS15
        case .bear:
            return.iOS15
        case .tiger:
            return.iOS15
        case .monkey:
            return.iOS15
        case .ram:
            return.iOS15
        case .rabbit:
            return.iOS15
        case .snake:
            return.iOS15
        case .chicken:
            return.iOS15
        case .pig:
            return.iOS15
        case .mouse:
            return.iOS15
        case .cow:
            return.iOS15
        case .dragon:
            return.iOS15
        case .retroAlien:
            return.iOS15
        case .robot:
            return.iOS15
        case .ghost:
            return.iOS15
        case .poop:
            return.iOS15
        case .skull:
            return.iOS15
        case .twoxTwoRectangles:
            return.iOS15
        case .twoxTwoRectanglesOutline:
            return.iOS15
        case .rectangleSplit:
            return.iOS15
        case .rectangleSplitThree:
            return.iOS15
        case .rectangleSplitThreeOutline:
            return.iOS15
        case .sendMessageOutline:
            return.iOS15
        case .brainHead:
            return.iOS15
        case .brain:
            return.iOS15
        case .faceGrinning:
            return.iOS15
        case .faceSmiling:
            return.iOS15
        case .faceGrinningSquint:
            return.iOS15
        case .faceTears:
            return.iOS15
        case .faceRolling:
            return.iOS15
        case .faceWink:
            return.iOS15
        case .faceGrimacing:
            return.iOS15
        case .faceLove:
            return.iOS15
        case .faceKiss:
            return.iOS15
        case .faceHearts:
            return.iOS15
        case .faceSunglasses:
            return.iOS15
        case .faceStarry:
            return.iOS15
        case .memoji:
            return.iOS15
        case .handSlash:
            return.iOS15
        case .handSlashOutline:
            return.iOS15
        case .thumbsUpEmoji:
            return.iOS15
        case .peace:
            return.iOS15
        case .loveGesture:
            return.iOS15
        case .closedFist:
            return.iOS15
        case .xSquare:
            return.iOS15
        case .checklist:
            return.iOS15
        case .doubleQuoteOutline:
            return.iOS15
        case .textBox:
            return.iOS15
        case .waveform:
            return.iOS15
        case .oneProngPuzzlePiece:
            return.iOS15
        case .cartoonHeart:
            return.iOS15
        case .twoCartoonHearts:
            return.iOS15
        case .cloudService:
            return .iOS15
        }
    }
    
    public var id: Int {
        switch self {
        case .car:
            return 59452
        case .carMultiple:
            return 61446
        case .electricCar:
            return 61447
        case .bus:
            return 59678
        case .busDouble:
            return 61448
        case .tram:
            return 61449
        case .tramTunnel:
            return 61450
        case .bike:
            return 59668
        case .motorcycle:
            return 59783
        case .ambulance:
            return 59652
        case .airplane:
            return 59648
        case .sailboat:
            return 59823
        case .house:
            return 59755
        case .church:
            return 59688
        case .buildings:
            return 59677
        case .shoppingCart:
            return 59828
        case .handbag:
            return 59750
        case .groceryStore:
            return 59747
        case .utensils:
            return 59863
        case .fuelstation:
            return 59741
        case .thermometer:
            return 59854
        case .sun:
            return 59845
        case .moon:
            return 59782
        case .moonCircle:
            return 61517
        case .snowflake:
            return 59835
        case .cloud:
            return 59714
        case .raincloud:
            return 59715
        case .umbrella:
            return 59861
        case .pineTree:
            return 59731
        case .flower:
            return 59468
        case .fire:
            return 59734
        case .footprints:
            return 59738
        case .signs:
            return 59724
        case .binoculars:
            return 59669
        case .compass:
            return 59717
        case .globe:
            return 59412
        case .mountain:
            return 59785
        case .picture:
            return 59784
        case .filmstrip:
            return 59733
        case .camera:
            return 59682
        case .movieCamera:
            return 59402
        case .microphone:
            return 59780
        case .videoIcon:
            return 59864
        case .clipboard:
            return 59711
        case .calendar:
            return 59681
        case .chatBubble:
            return 59414
        case .messageBubbles:
            return 59403
        case .textBubble:
            return 59779
        case .envelope:
            return 59773
        case .envelopeOpen:
            return 59774
        case .paperAirplane:
            return 59836
        case .paperAirplaneCircle:
            return 61462
        case .briefcase:
            return 59676
        case .folder:
            return 59737
        case .creditCard:
            return 59719
        case .watch:
            return 59865
        case .phone:
            return 59814
        case .laptop:
            return 59436
        case .keyboard:
            return 59446
        case .keyboardOld:
            return 59494
        case .calculator:
            return 59680
        case .barGraph:
            return 59662
        case .printer:
            return 59817
        case .hardDrive:
            return 59752
        case .server:
            return 59722
        case .database:
            return 59519
        case .networkStorage:
            return 59826
        case .archive:
            return 59653
        case .cube:
            return 59721
        case .tv:
            return 59851
        case .gameController:
            return 59742
        case .puzzlePiece:
            return 59818
        case .headphones:
            return 59753
        case .headphonesCircle:
            return 61479
        case .ear:
            return 61481
        case .musicNote:
            return 59790
        case .speakerWave1:
            return 59839
        case .speakerWave2:
            return 61470
        case .speakerWave3:
            return 61471
        case .mute:
            return 61472
        case .speaker:
            return 61473
        case .hifiSpeaker:
            return 61478
        case .desktopSpeaker:
            return 61474
        case .bookshelf:
            return 59671
        case .openBook:
            return 59465
        case .sashBook:
            return 59672
        case .closedBook:
            return 61442
        case .glasses:
            return 59745
        case .mask:
            return 59777
        case .ticket:
            return 59788
        case .dramaMask:
            return 59730
        case .dice:
            return 59723
        case .baseball:
            return 59663
        case .basketball:
            return 59664
        case .soccerBall:
            return 59837
        case .tennisBall:
            return 59852
        case .football:
            return 59456
        case .lifePreserver:
            return 59762
        case .telescope:
            return 59850
        case .microscope:
            return 59781
        case .horse:
            return 59756
        case .clock:
            return 59712
        case .alarmClock:
            return 59649
        case .stopwatch:
            return 59844
        case .bell:
            return 59667
        case .sparklingBell:
            return 59838
        case .heart:
            return 59754
        case .star:
            return 59841
        case .trophy:
            return 59860
        case .lightbulb:
            return 59763
        case .lightningBolt:
            return 59764
        case .flag:
            return 59736
        case .tag:
            return 59848
        case .key:
            return 59760
        case .hourglass:
            return 59757
        case .lock:
            return 59770
        case .unlockButton:
            return 59862
        case .battery:
            return 59489
        case .magicWand:
            return 59511
        case .magicWandAlt:
            return 59771
        case .paintbrush:
            return 59793
        case .pencil:
            return 59798
        case .paperclip:
            return 59794
        case .scissors:
            return 59824
        case .magnifyingGlass:
            return 59772
        case .chainlink:
            return 59685
        case .eyedropper:
            return 59716
        case .hammer:
            return 59748
        case .wrench:
            return 59870
        case .tools:
            return 59749
        case .gear:
            return 59743
        case .hammerAlt:
            return 59473
        case .screwdriver:
            return 59825
        case .hand:
            return 59751
        case .trashcan:
            return 59859
        case .waterDrop:
            return 59866
        case .mug:
            return 59789
        case .steamingBowl:
            return 59842
        case .apple:
            return 59740
        case .carrot:
            return 59683
        case .fish:
            return 59735
        case .cake:
            return 59679
        case .wineBottle:
            return 59868
        case .martini:
            return 59776
        case .clothesHanger:
            return 59713
        case .laundryMachine:
            return 59761
        case .oven:
            return 59792
        case .shirt:
            return 59827
        case .bathtub:
            return 59665
        case .shower:
            return 59829
        case .pill:
            return 59461
        case .medicine:
            return 59815
        case .medicineBottle:
            return 59778
        case .bandage:
            return 59660
        case .inhaler:
            return 59759
        case .stethoscope:
            return 59843
        case .syringe:
            return 59847
        case .atom:
            return 59657
        case .chemical:
            return 59686
        case .cat:
            return 59684
        case .dog:
            return 59728
        case .pawPrint:
            return 59796
        case .thumbsUp:
            return 59857
        case .graduate:
            return 59746
        case .gift:
            return 59744
        case .alien:
            return 59651
        case .bed:
            return 59666
        case .stairs:
            return 59840
        case .rocket:
            return 59822
        case .map:
            return 61444
        case .gauge:
            return 61452
        case .speedometer:
            return 61453
        case .barometer:
            return 61454
        case .network:
            return 61455
        case .rectangleStack:
            return 61456
        case .squareStack:
            return 61457
        case .threeDSquareStack:
            return 61458
        case .photoStack:
            return 61459
        case .photoStackAlt:
            return 61460
        case .aperture:
            return 61461
        case .note:
            return 61464
        case .noteText:
            return 61465
        case .noteTextPlus:
            return 61466
        case .sendMessage:
            return 61467
        case .addMessage:
            return 61468
        case .earPods:
            return 61475
        case .airPods:
            return 61476
        case .airPodsPro:
            return 61477
        case .radio:
            return 61480
        case .appleTV:
            return 61482
        case .homePod:
            return 61483
        case .appleWatchWaves:
            return 61484
        case .iPhone:
            return 61486
        case .iPhoneWave:
            return 61487
        case .iPhoneApps:
            return 61488
        case .iPad:
            return 61489
        case .iPadAlt:
            return 61490
        case .iPod:
            return 61491
        case .babyGirl:
            return 59658
        case .babyBoy:
            return 59659
        case .child:
            return 59687
        case .man:
            return 59775
        case .woman:
            return 59869
        case .wheelchair:
            return 59806
        case .person:
            return 59801
        case .people2:
            return 59800
        case .people3:
            return 59799
        case .person2:
            return 59437
        case .personAlter:
            return 59802
        case .personSpeech:
            return 59804
        case .personDancer:
            return 59803
        case .personLifting:
            return 59807
        case .personSkiing:
            return 59809
        case .personSnowboarding:
            return 59810
        case .personSwimming:
            return 59811
        case .personHiking:
            return 59805
        case .personWalking:
            return 59812
        case .personWalkingCane:
            return 59813
        case .personRunning:
            return 59808
        case .personRunningCircle:
            return 61493
        case .personSprinting:
            return 61494
        case .personClose:
            return 61495
        case .personOpen:
            return 61496
        case .shortcuts:
            return 61440
        case .alertTriangle:
            return 59650
        case .arrowCurvedLeft:
            return 59654
        case .arrowCurvedRight:
            return 59655
        case .bookmark:
            return 59670
        case .barcode:
            return 59661
        case .QRCode:
            return 59819
        case .play:
            return 59508
        case .boxFilled:
            return 59673
        case .boxOutline:
            return 59674
        case .braille:
            return 59675
        case .circleLeftArrow:
            return 59696
        case .circleRightArrow:
            return 59705
        case .downloadArrow:
            return 59693
        case .circledUpArrow:
            return 59707
        case .circledDownArrow:
            return 59692
        case .uploadArrow:
            return 59708
        case .circledPlay:
            return 59699
        case .circledRewind:
            return 59704
        case .circledPower:
            return 59702
        case .circledStop:
            return 59706
        case .circledFastForward:
            return 59695
        case .circledQuestionMark:
            return 59703
        case .circledCheckmark:
            return 59690
        case .circledPlus:
            return 59700
        case .circledX:
            return 59709
        case .circledPi:
            return 59698
        case .circledI:
            return 59697
        case .smileyFace:
            return 59834
        case .document:
            return 59725
        case .dollarSign:
            return 59395
        case .poundSign:
            return 59512
        case .euroSign:
            return 59448
        case .yenSign:
            return 59514
        case .bitcoin:
            return 59515
        case .asterisk:
            return 59656
        case .documentFilled:
            return 59726
        case .documentOutline:
            return 59727
        case .newsArticle:
            return 59791
        case .fourSquares:
            return 59739
        case .ellipsis:
            return 59392
        case .list:
            return 59445
        case .twelveSquares:
            return 59405
        case .Connected:
            return 59718
        case .infinity:
            return 59758
        case .recycle:
            return 59820
        case .loadingIndicator:
            return 59767
        case .loadingIndicatorAlt:
            return 59516
        case .Target:
            return 59849
        case .podcasts:
            return 59816
        case .targetAlt:
            return 59454
        case .locationArrow:
            return 59768
        case .locationPin:
            return 59769
        case .parking:
            return 59795
        case .crop:
            return 59720
        case .shrinkArrow:
            return 59830
        case .moveArrow:
            return 59786
        case .repostArrows:
            return 59821
        case .syncArrows:
            return 59846
        case .shuffleArrows:
            return 59832
        case .sliders:
            return 59833
        case .doubleQuote:
            return 59729
        case .peaceSign:
            return 59797
        case .threeCircles:
            return 59856
        case .textSymbol:
            return 59853
        case .feedRight:
            return 59732
        case .feed:
            return 59497
        case .wifi:
            return 59867
        case .airdrop:
            return 61501
        case .arrowDiamond:
            return 61497
        case .directionsRight:
            return 61498
        case .airplayAudio:
            return 61499
        case .airplayVideo:
            return 61500
        case .musicNoteList:
            return 61502
        case .musicNoteAlt:
            return 61503
        case .musicSquareStack:
            return 61504
        case .musicWaveForm:
            return 61505
        case .livePlay:
            return 61506
        case .livePhoto:
            return 61507
        case .sloMo:
            return 61508
        case .timeLapse:
            return 61509
        case .calendarPlus:
            return 61510
        case .calendarExclamation:
            return 61511
        case .timer:
            return 61512
        case .timerSquare:
            return 61513
        case .compose:
            return 61514
        case .duplicate:
            return 61515
        case .nightShift:
            return 61518
        case .trueTone:
            return 61519
        case .dialMin:
            return 61520
        case .dialMax:
            return 61521
        case .QRViewFinder:
            return 61522
        case .cameraViewFinder:
            return 61523
        case .walletPass:
            return 61524
        case .appearance:
            return 61525
        case .noSign:
            return 61528
        case .command:
            return 61529
        case .commandCircle:
            return 61530
        case .commandSquare:
            return 61531
        case .blank:
            return 999999
        case .bumps:
            return 59433
        case .stripe:
            return 59455
        case .facetime:
            return 59583
        case .circledHeart:
            return 59542
        case .documentOutlineAlt:
            return 59496
        case .circledA:
            return 59520
        case .folderGear:
            return 61571
        case .folderOutline:
            return 61570
        case .takeout:
            return 61553
        case .starHalf:
            return 61579
        case .sparkles:
            return 61581
        case .surgicalMask:
            return 61551
        case .bear:
            return 61554
        case .tiger:
            return 61555
        case .monkey:
            return 61556
        case .ram:
            return 61557
        case .rabbit:
            return 61558
        case .snake:
            return 61559
        case .chicken:
            return 61560
        case .pig:
            return 61561
        case .mouse:
            return 61562
        case .cow:
            return 61563
        case .dragon:
            return 61564
        case .retroAlien:
            return 61565
        case .robot:
            return 61566
        case .ghost:
            return 61567
        case .poop:
            return 61568
        case .skull:
            return 61569
        case .twoxTwoRectangles:
            return 61572
        case .twoxTwoRectanglesOutline:
            return 61573
        case .rectangleSplit:
            return 61574
        case .rectangleSplitThree:
            return 61575
        case .rectangleSplitThreeOutline:
            return 61576
        case .sendMessageOutline:
            return 61582
        case .brainHead:
            return 61532
        case .brain:
            return 61533
        case .faceGrinning:
            return 61534
        case .faceSmiling:
            return 61535
        case .faceGrinningSquint:
            return 61536
        case .faceTears:
            return 61537
        case .faceRolling:
            return 61538
        case .faceWink:
            return 61539
        case .faceGrimacing:
            return 61540
        case .faceLove:
            return 61541
        case .faceKiss:
            return 61542
        case .faceHearts:
            return 61543
        case .faceSunglasses:
            return 61544
        case .faceStarry:
            return 61545
        case .memoji:
            return 61546
        case .handSlash:
            return 61584
        case .handSlashOutline:
            return 61585
        case .thumbsUpEmoji:
            return 61547
        case .peace:
            return 61548
        case .loveGesture:
            return 61549
        case .closedFist:
            return 61550
        case .xSquare:
            return 61589
        case .checklist:
            return 61587
        case .doubleQuoteOutline:
            return 61583
        case .textBox:
            return 61588
        case .waveform:
            return 61586
        case .oneProngPuzzlePiece:
            return 61552
        case .cartoonHeart:
            return 61577
        case .twoCartoonHearts:
            return 61578
        case .cloudService:
            return 59459
        }
    }
}
