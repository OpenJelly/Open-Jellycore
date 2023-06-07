
//
//  Jelly_WorkoutIdentifiers.swift
//  JellycoreV2
//
//  Created by Taylor Lineman on 1/2/23.
//

enum Jelly_WorkoutIdentifiers: String, JellyEnum, Codable {
    case AmericanFootball
    case Archery
    case AustralianFootball
    case Badminton
    case Barre
    case Baseball
    case Basketball
    case Bowling
    case Boxing
    case Climbing
    case Cooldown
    case CoreTraining
    case Cricket
    case CrossCountrySkiing
    case CrossTraining
    case Curling
    case Dance
    case DiscSports
    case DownhillSkiing
    case Elliptical
    case EquestrianSports
    case Fencing
    case Fishing
    case FitnessGaming
    case Flexibility
    case FunctionalStrengthTraining
    case Golf
    case Gymnastics
    case HandCycling
    case Handball
    case HighIntensityIntervalTraining
    case Hiking
    case Hockey
    case Hunting
    case IndoorCycle
    case IndoorRun
    case IndoorWalk
    case JumpRope
    case Kickboxing
    case Lacrosse
    case MartialArts
    case MindAndBody
    case MixedCardio
    case OpenWaterSwim
    case Other
    case OutdoorCycle
    case OutdoorRun
    case OutdoorWalk
    case Paddling
    case Pickleball
    case Pilates
    case Play
    case PoolSwim
    case Racquetball
    case Rolling
    case Rower
    case Rugby
    case Sailing
    case Skating
    case SnowSports
    case Snowboarding
    case Soccer
    case SocialDance
    case Softball
    case Squash
    case StairStepper
    case Stairs
    case StepTraining
    case Surfing
    case TableTennis
    case TaiChi
    case Tennis
    case TrackAddField
    case TraditionalStrengthTraining
    case Volleyball
    case WaterFitness
    case WaterPolo
    case WaterSports
    case Wrestling
    case Yoga

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    init?(parameterItem: FunctionCallParameterItem, scopedVariables: [Variable]) {
        if let itemContent = parameterItem.item?.content {
            self.init(rawValue: itemContent)
        } else {
            self.init(rawValue: parameterItem.content)
        }
    }
    
    var value: String {
        switch self {
        case .AmericanFootball:
            return "1"
        case .Archery:
            return "2"
        case .AustralianFootball:
            return "3"
        case .Badminton:
            return "4"
        case .Barre:
            return "58"
        case .Baseball:
            return "4"
        case .Basketball:
            return "6"
        case .Bowling:
            return "7"
        case .Boxing:
            return "8"
        case .Climbing:
            return "9"
        case .Cooldown:
            return "80"
        case .CoreTraining:
            return "59"
        case .Cricket:
            return "10"
        case .CrossCountrySkiing:
            return "60"
        case .CrossTraining:
            return "11"
        case .Curling:
            return "12"
        case .Dance:
            return "77"
        case .DiscSports:
            return "75"
        case .DownhillSkiing:
            return "61"
        case .Elliptical:
            return "16"
        case .EquestrianSports:
            return "17"
        case .Fencing:
            return "18"
        case .Fishing:
            return "19"
        case .FitnessGaming:
            return "76"
        case .Flexibility:
            return "62"
        case .FunctionalStrengthTraining:
            return "1513"
        case .Golf:
            return "21"
        case .Gymnastics:
            return "22"
        case .HandCycling:
            return "74"
        case .Handball:
            return "23"
        case .HighIntensityIntervalTraining:
            return "63"
        case .Hiking:
            return "24"
        case .Hockey:
            return "25"
        case .Hunting:
            return "26"
        case .IndoorCycle:
            return "13"
        case .IndoorRun:
            return "37"
        case .IndoorWalk:
            return "52"
        case .JumpRope:
            return "64"
        case .Kickboxing:
            return "65"
        case .Lacrosse:
            return "27"
        case .MartialArts:
            return "28"
        case .MindAndBody:
            return "29"
        case .MixedCardio:
            return "73"
        case .OpenWaterSwim:
            return "46"
        case .Other:
            return "3000"
        case .OutdoorCycle:
            return "13"
        case .OutdoorRun:
            return "37"
        case .OutdoorWalk:
            return "52"
        case .Paddling:
            return "31"
        case .Pickleball:
            return "79"
        case .Pilates:
            return "66"
        case .Play:
            return "32"
        case .PoolSwim:
            return "46"
        case .Racquetball:
            return "34"
        case .Rolling:
            return "33"
        case .Rower:
            return "35"
        case .Rugby:
            return "36"
        case .Sailing:
            return "38"
        case .Skating:
            return "39"
        case .SnowSports:
            return "40"
        case .Snowboarding:
            return "67"
        case .Soccer:
            return "41"
        case .SocialDance:
            return "78"
        case .Softball:
            return "42"
        case .Squash:
            return "43"
        case .StairStepper:
            return "44"
        case .Stairs:
            return "68"
        case .StepTraining:
            return "69"
        case .Surfing:
            return "45"
        case .TableTennis:
            return "47"
        case .TaiChi:
            return "72"
        case .Tennis:
            return "48"
        case .TrackAddField:
            return "49"
        case .TraditionalStrengthTraining:
            return "50"
        case .Volleyball:
            return "51"
        case .WaterFitness:
            return "53"
        case .WaterPolo:
            return "54"
        case .WaterSports:
            return "55"
        case .Wrestling:
            return "56"
        case .Yoga:
            return "57"
        }
    }
}

extension Jelly_WorkoutIdentifiers {
    enum PersonalEncodingKeys: CodingKey {
        case Identifier
        case IsIndoor
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: PersonalEncodingKeys.self)
        try container.encode(Int(value), forKey: .Identifier)
        try container.encode(false, forKey: .IsIndoor)
    }
}
