//
//  Images & Icons.swift
//  
//
//  Created by Taylor Lineman on 1/7/23.
//

public enum ShortcutImage: String, CaseIterable {
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
    
    var version: ShortcutsHostVersion {
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
    
    var id: Int {
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
    
    var gradient: (top: String, bottom: String) {
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

public enum ShortcutGlyph: String, CaseIterable {
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

    var version: ShortcutsHostVersion {
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
    
    var id: Int {
        switch self {
        case .car:
            return 5945959452
        case .carMultiple:
            return 5945961446
        case .electricCar:
            return 5945961447
        case .bus:
            return 5945959678
        case .busDouble:
            return 5945961448
        case .tram:
            return 5945961449
        case .tramTunnel:
            return 5945961450
        case .bike:
            return 5945959668
        case .motorcycle:
            return 5945959783
        case .ambulance:
            return 5945959652
        case .airplane:
            return 5945959648
        case .sailboat:
            return 5945959823
        case .house:
            return 5945959755
        case .church:
            return 5945959688
        case .buildings:
            return 5945959677
        case .shoppingCart:
            return 5945959828
        case .handbag:
            return 5945959750
        case .groceryStore:
            return 5945959747
        case .utensils:
            return 5945959863
        case .fuelstation:
            return 5945959741
        case .thermometer:
            return 5945959854
        case .sun:
            return 5945959845
        case .moon:
            return 5945959782
        case .moonCircle:
            return 5945961517
        case .snowflake:
            return 5945959835
        case .cloud:
            return 5945959714
        case .raincloud:
            return 5945959715
        case .umbrella:
            return 5945959861
        case .pineTree:
            return 5945959731
        case .flower:
            return 5945959468
        case .fire:
            return 5945959734
        case .footprints:
            return 5945959738
        case .signs:
            return 5945959724
        case .binoculars:
            return 5945959669
        case .compass:
            return 5945959717
        case .globe:
            return 5945959412
        case .mountain:
            return 5945959785
        case .picture:
            return 5945959784
        case .filmstrip:
            return 5945959733
        case .camera:
            return 5945959682
        case .movieCamera:
            return 5945959402
        case .microphone:
            return 5945959780
        case .videoIcon:
            return 5945959864
        case .clipboard:
            return 5945959711
        case .calendar:
            return 5945959681
        case .chatBubble:
            return 5945959414
        case .messageBubbles:
            return 5945959403
        case .textBubble:
            return 5945959779
        case .envelope:
            return 5945959773
        case .envelopeOpen:
            return 5945959774
        case .paperAirplane:
            return 5945959836
        case .paperAirplaneCircle:
            return 5945961462
        case .briefcase:
            return 5945959676
        case .folder:
            return 5945959737
        case .creditCard:
            return 5945959719
        case .watch:
            return 5945959865
        case .phone:
            return 5945959814
        case .laptop:
            return 5945959436
        case .keyboard:
            return 5945959446
        case .keyboardOld:
            return 5945959494
        case .calculator:
            return 5945959680
        case .barGraph:
            return 5945959662
        case .printer:
            return 5945959817
        case .hardDrive:
            return 5945959752
        case .server:
            return 5945959722
        case .database:
            return 5945959519
        case .networkStorage:
            return 5945959826
        case .archive:
            return 5945959653
        case .cube:
            return 5945959721
        case .tv:
            return 5945959851
        case .gameController:
            return 5945959742
        case .puzzlePiece:
            return 5945959818
        case .headphones:
            return 5945959753
        case .headphonesCircle:
            return 5945961479
        case .ear:
            return 5945961481
        case .musicNote:
            return 5945959790
        case .speakerWave1:
            return 5945959839
        case .speakerWave2:
            return 5945961470
        case .speakerWave3:
            return 5945961471
        case .mute:
            return 5945961472
        case .speaker:
            return 5945961473
        case .hifiSpeaker:
            return 5945961478
        case .desktopSpeaker:
            return 5945961474
        case .bookshelf:
            return 5945959671
        case .openBook:
            return 5945959465
        case .sashBook:
            return 5945959672
        case .closedBook:
            return 5945961442
        case .glasses:
            return 5945959745
        case .mask:
            return 5945959777
        case .ticket:
            return 5945959788
        case .dramaMask:
            return 5945959730
        case .dice:
            return 5945959723
        case .baseball:
            return 5945959663
        case .basketball:
            return 5945959664
        case .soccerBall:
            return 5945959837
        case .tennisBall:
            return 5945959852
        case .football:
            return 5945959456
        case .lifePreserver:
            return 5945959762
        case .telescope:
            return 5945959850
        case .microscope:
            return 5945959781
        case .horse:
            return 5945959756
        case .clock:
            return 5945959712
        case .alarmClock:
            return 5945959649
        case .stopwatch:
            return 5945959844
        case .bell:
            return 5945959667
        case .sparklingBell:
            return 5945959838
        case .heart:
            return 5945959754
        case .star:
            return 5945959841
        case .trophy:
            return 5945959860
        case .lightbulb:
            return 5945959763
        case .lightningBolt:
            return 5945959764
        case .flag:
            return 5945959736
        case .tag:
            return 5945959848
        case .key:
            return 5945959760
        case .hourglass:
            return 5945959757
        case .lock:
            return 5945959770
        case .unlockButton:
            return 5945959862
        case .battery:
            return 5945959489
        case .magicWand:
            return 5945959511
        case .magicWandAlt:
            return 5945959771
        case .paintbrush:
            return 5945959793
        case .pencil:
            return 5945959798
        case .paperclip:
            return 5945959794
        case .scissors:
            return 5945959824
        case .magnifyingGlass:
            return 5945959772
        case .chainlink:
            return 5945959685
        case .eyedropper:
            return 5945959716
        case .hammer:
            return 5945959748
        case .wrench:
            return 5945959870
        case .tools:
            return 5945959749
        case .gear:
            return 5945959743
        case .hammerAlt:
            return 5945959473
        case .screwdriver:
            return 5945959825
        case .hand:
            return 5945959751
        case .trashcan:
            return 5945959859
        case .waterDrop:
            return 5945959866
        case .mug:
            return 5945959789
        case .steamingBowl:
            return 5945959842
        case .apple:
            return 5945959740
        case .carrot:
            return 5945959683
        case .fish:
            return 5945959735
        case .cake:
            return 5945959679
        case .wineBottle:
            return 5945959868
        case .martini:
            return 5945959776
        case .clothesHanger:
            return 5945959713
        case .laundryMachine:
            return 5945959761
        case .oven:
            return 5945959792
        case .shirt:
            return 5945959827
        case .bathtub:
            return 5945959665
        case .shower:
            return 5945959829
        case .pill:
            return 5945959461
        case .medicine:
            return 5945959815
        case .medicineBottle:
            return 5945959778
        case .bandage:
            return 5945959660
        case .inhaler:
            return 5945959759
        case .stethoscope:
            return 5945959843
        case .syringe:
            return 5945959847
        case .atom:
            return 5945959657
        case .chemical:
            return 5945959686
        case .cat:
            return 5945959684
        case .dog:
            return 5945959728
        case .pawPrint:
            return 5945959796
        case .thumbsUp:
            return 5945959857
        case .graduate:
            return 5945959746
        case .gift:
            return 5945959744
        case .alien:
            return 5945959651
        case .bed:
            return 5945959666
        case .stairs:
            return 5945959840
        case .rocket:
            return 5945959822
        case .map:
            return 5945961444
        case .gauge:
            return 5945961452
        case .speedometer:
            return 5945961453
        case .barometer:
            return 5945961454
        case .network:
            return 5945961455
        case .rectangleStack:
            return 5945961456
        case .squareStack:
            return 5945961457
        case .threeDSquareStack:
            return 5945961458
        case .photoStack:
            return 5945961459
        case .photoStackAlt:
            return 5945961460
        case .aperture:
            return 5945961461
        case .note:
            return 5945961464
        case .noteText:
            return 5945961465
        case .noteTextPlus:
            return 5945961466
        case .sendMessage:
            return 5945961467
        case .addMessage:
            return 5945961468
        case .earPods:
            return 5945961475
        case .airPods:
            return 5945961476
        case .airPodsPro:
            return 5945961477
        case .radio:
            return 5945961480
        case .appleTV:
            return 5945961482
        case .homePod:
            return 5945961483
        case .appleWatchWaves:
            return 5945961484
        case .iPhone:
            return 5945961486
        case .iPhoneWave:
            return 5945961487
        case .iPhoneApps:
            return 5945961488
        case .iPad:
            return 5945961489
        case .iPadAlt:
            return 5945961490
        case .iPod:
            return 5945961491
        case .babyGirl:
            return 5945959658
        case .babyBoy:
            return 5945959659
        case .child:
            return 5945959687
        case .man:
            return 5945959775
        case .woman:
            return 5945959869
        case .wheelchair:
            return 5945959806
        case .person:
            return 5945959801
        case .people2:
            return 5945959800
        case .people3:
            return 5945959799
        case .person2:
            return 5945959437
        case .personAlter:
            return 5945959802
        case .personSpeech:
            return 5945959804
        case .personDancer:
            return 5945959803
        case .personLifting:
            return 5945959807
        case .personSkiing:
            return 5945959809
        case .personSnowboarding:
            return 5945959810
        case .personSwimming:
            return 5945959811
        case .personHiking:
            return 5945959805
        case .personWalking:
            return 5945959812
        case .personWalkingCane:
            return 5945959813
        case .personRunning:
            return 5945959808
        case .personRunningCircle:
            return 5945961493
        case .personSprinting:
            return 5945961494
        case .personClose:
            return 5945961495
        case .personOpen:
            return 5945961496
        case .shortcuts:
            return 5945961440
        case .alertTriangle:
            return 5945959650
        case .arrowCurvedLeft:
            return 5945959654
        case .arrowCurvedRight:
            return 5945959655
        case .bookmark:
            return 5945959670
        case .barcode:
            return 5945959661
        case .QRCode:
            return 5945959819
        case .play:
            return 5945959508
        case .boxFilled:
            return 5945959673
        case .boxOutline:
            return 5945959674
        case .braille:
            return 5945959675
        case .circleLeftArrow:
            return 5945959696
        case .circleRightArrow:
            return 5945959705
        case .downloadArrow:
            return 5945959693
        case .circledUpArrow:
            return 5945959707
        case .circledDownArrow:
            return 5945959692
        case .uploadArrow:
            return 5945959708
        case .circledPlay:
            return 5945959699
        case .circledRewind:
            return 5945959704
        case .circledPower:
            return 5945959702
        case .circledStop:
            return 5945959706
        case .circledFastForward:
            return 5945959695
        case .circledQuestionMark:
            return 5945959703
        case .circledCheckmark:
            return 5945959690
        case .circledPlus:
            return 5945959700
        case .circledX:
            return 5945959709
        case .circledPi:
            return 5945959698
        case .circledI:
            return 5945959697
        case .smileyFace:
            return 5945959834
        case .document:
            return 5945959725
        case .dollarSign:
            return 5945959395
        case .poundSign:
            return 5945959512
        case .euroSign:
            return 5945959448
        case .yenSign:
            return 5945959514
        case .bitcoin:
            return 5945959515
        case .asterisk:
            return 5945959656
        case .documentFilled:
            return 5945959726
        case .documentOutline:
            return 5945959727
        case .newsArticle:
            return 5945959791
        case .fourSquares:
            return 5945959739
        case .ellipsis:
            return 5945959392
        case .list:
            return 5945959445
        case .twelveSquares:
            return 5945959405
        case .Connected:
            return 5945959718
        case .infinity:
            return 5945959758
        case .recycle:
            return 5945959820
        case .loadingIndicator:
            return 5945959767
        case .loadingIndicatorAlt:
            return 5945959516
        case .Target:
            return 5945959849
        case .podcasts:
            return 5945959816
        case .targetAlt:
            return 5945959454
        case .locationArrow:
            return 5945959768
        case .locationPin:
            return 5945959769
        case .parking:
            return 5945959795
        case .crop:
            return 5945959720
        case .shrinkArrow:
            return 5945959830
        case .moveArrow:
            return 5945959786
        case .repostArrows:
            return 5945959821
        case .syncArrows:
            return 5945959846
        case .shuffleArrows:
            return 5945959832
        case .sliders:
            return 5945959833
        case .doubleQuote:
            return 5945959729
        case .peaceSign:
            return 5945959797
        case .threeCircles:
            return 5945959856
        case .textSymbol:
            return 5945959853
        case .feedRight:
            return 5945959732
        case .feed:
            return 5945959497
        case .wifi:
            return 5945959867
        case .airdrop:
            return 5945961501
        case .arrowDiamond:
            return 5945961497
        case .directionsRight:
            return 5945961498
        case .airplayAudio:
            return 5945961499
        case .airplayVideo:
            return 5945961500
        case .musicNoteList:
            return 5945961502
        case .musicNoteAlt:
            return 5945961503
        case .musicSquareStack:
            return 5945961504
        case .musicWaveForm:
            return 5945961505
        case .livePlay:
            return 5945961506
        case .livePhoto:
            return 5945961507
        case .sloMo:
            return 5945961508
        case .timeLapse:
            return 5945961509
        case .calendarPlus:
            return 5945961510
        case .calendarExclamation:
            return 5945961511
        case .timer:
            return 5945961512
        case .timerSquare:
            return 5945961513
        case .compose:
            return 5945961514
        case .duplicate:
            return 5945961515
        case .nightShift:
            return 5945961518
        case .trueTone:
            return 5945961519
        case .dialMin:
            return 5945961520
        case .dialMax:
            return 5945961521
        case .QRViewFinder:
            return 5945961522
        case .cameraViewFinder:
            return 5945961523
        case .walletPass:
            return 5945961524
        case .appearance:
            return 5945961525
        case .noSign:
            return 5945961528
        case .command:
            return 5945961529
        case .commandCircle:
            return 5945961530
        case .commandSquare:
            return 5945961531
        case .blank:
            return 59459999999
        case .bumps:
            return 5945959433
        case .stripe:
            return 5945959455
        case .facetime:
            return 5945959583
        case .circledHeart:
            return 5945959542
        case .documentOutlineAlt:
            return 5945959496
        case .circledA:
            return 5945959520
        case .folderGear:
            return 5945961571
        case .folderOutline:
            return 5945961570
        case .takeout:
            return 5945961553
        case .starHalf:
            return 5945961579
        case .sparkles:
            return 5945961581
        case .surgicalMask:
            return 5945961551
        case .bear:
            return 5945961554
        case .tiger:
            return 5945961555
        case .monkey:
            return 5945961556
        case .ram:
            return 5945961557
        case .rabbit:
            return 5945961558
        case .snake:
            return 5945961559
        case .chicken:
            return 5945961560
        case .pig:
            return 5945961561
        case .mouse:
            return 5945961562
        case .cow:
            return 5945961563
        case .dragon:
            return 5945961564
        case .retroAlien:
            return 5945961565
        case .robot:
            return 5945961566
        case .ghost:
            return 5945961567
        case .poop:
            return 5945961568
        case .skull:
            return 5945961569
        case .twoxTwoRectangles:
            return 5945961572
        case .twoxTwoRectanglesOutline:
            return 5945961573
        case .rectangleSplit:
            return 5945961574
        case .rectangleSplitThree:
            return 5945961575
        case .rectangleSplitThreeOutline:
            return 5945961576
        case .sendMessageOutline:
            return 5945961582
        case .brainHead:
            return 5945961532
        case .brain:
            return 5945961533
        case .faceGrinning:
            return 5945961534
        case .faceSmiling:
            return 5945961535
        case .faceGrinningSquint:
            return 5945961536
        case .faceTears:
            return 5945961537
        case .faceRolling:
            return 5945961538
        case .faceWink:
            return 5945961539
        case .faceGrimacing:
            return 5945961540
        case .faceLove:
            return 5945961541
        case .faceKiss:
            return 5945961542
        case .faceHearts:
            return 5945961543
        case .faceSunglasses:
            return 5945961544
        case .faceStarry:
            return 5945961545
        case .memoji:
            return 5945961546
        case .handSlash:
            return 5945961584
        case .handSlashOutline:
            return 5945961585
        case .thumbsUpEmoji:
            return 5945961547
        case .peace:
            return 5945961548
        case .loveGesture:
            return 5945961549
        case .closedFist:
            return 5945961550
        case .xSquare:
            return 5945961589
        case .checklist:
            return 5945961587
        case .doubleQuoteOutline:
            return 5945961583
        case .textBox:
            return 5945961588
        case .waveform:
            return 5945961586
        case .oneProngPuzzlePiece:
            return 5945961552
        case .cartoonHeart:
            return 5945961577
        case .twoCartoonHearts:
            return 5945961578
        case .cloudService:
            return 59459
        }
    }
}
