//
//  Jelly_WFWorkoutReadableActivityType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFWorkoutReadableActivityType: String, JellyEnum, Codable {
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
	case CoreTraining
	case Cricket
	case CrossCountrySkiing
	case CrossTraining
	case Curling
	case Cycling
	case Dance
	case DanceInspiredTraining
	case DownhillSkiing
	case Elliptical
	case EquestrianSports
	case Fencing
	case Fishing
	case Flexibility
	case FunctionalStrengthTraining
	case Golf
	case HandCycling
	case Handball
	case HighIntensityIntervalTraining
	case Hiking
	case Hockey
	case Hunting
	case JumpRode
	case Kickboxing
	case Lacrosse
	case MartialArts
	case MindAndBody
	case MixedCardio
	case MixedMetabolicCardioTraining
	case Other
	case PaddleSports
	case Pilates
	case Play
	case PreparationAndRecovery
	case Racquetball
	case Rowling
	case Rugby
	case Running
	case Sailing
	case SkatingSports
	case SnowSports
	case Snowboarding
	case Soccer
	case Softball
	case Squash
	case StairStepper
	case Stairs
	case StepTraining
	case SurfingSports
	case Swimming
	case TableTennis
	case TaiChi
	case Tennis
	case TrackAndField
	case TraditionalStrengthTraining
	case Volleyball
	case Walking
	case WaterFitness
	case WaterPolo
	case WaterSports
	case WheelchairRunPace
	case WheelchairWalkPace
	case Wrestling
	case Yoga

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .AmericanFootball:
			return "American Football"
		case .Archery:
			return "Archery"
		case .AustralianFootball:
			return "Australian Football"
		case .Badminton:
			return "Badminton"
		case .Barre:
			return "Barre"
		case .Baseball:
			return "Baseball"
		case .Basketball:
			return "Basketball"
		case .Bowling:
			return "Bowling"
		case .Boxing:
			return "Boxing"
		case .Climbing:
			return "Climbing"
		case .CoreTraining:
			return "Core Training"
		case .Cricket:
			return "Cricket"
		case .CrossCountrySkiing:
			return "Cross Country Skiing"
		case .CrossTraining:
			return "Cross Training"
		case .Curling:
			return "Curling"
		case .Cycling:
			return "Cycling"
		case .Dance:
			return "Dance"
		case .DanceInspiredTraining:
			return "Dance Inspired Training"
		case .DownhillSkiing:
			return "Downhill Skiing"
		case .Elliptical:
			return "Elliptical"
		case .EquestrianSports:
			return "Equestrian Sports"
		case .Fencing:
			return "Fencing"
		case .Fishing:
			return "Fishing"
		case .Flexibility:
			return "Flexibility"
		case .FunctionalStrengthTraining:
			return "Functional Strength Training"
		case .Golf:
			return "Golf"
		case .HandCycling:
			return "Hand Cycling"
		case .Handball:
			return "Handball"
		case .HighIntensityIntervalTraining:
			return "High Intensity Interval Training"
		case .Hiking:
			return "Hiking"
		case .Hockey:
			return "Hockey"
		case .Hunting:
			return "Hunting"
		case .JumpRode:
			return "Jump Rode"
		case .Kickboxing:
			return "Kickboxing"
		case .Lacrosse:
			return "Lacrosse"
		case .MartialArts:
			return "Martial Arts"
		case .MindAndBody:
			return "Mind And Body"
		case .MixedCardio:
			return "Mixed Cardio"
		case .MixedMetabolicCardioTraining:
			return "Mixed Metabolic Cardio Training"
		case .Other:
			return "Other"
		case .PaddleSports:
			return "Paddle Sports"
		case .Pilates:
			return "Pilates"
		case .Play:
			return "Play"
		case .PreparationAndRecovery:
			return "Preparation And Recovery"
		case .Racquetball:
			return "Racquetball"
		case .Rowling:
			return "Rowling"
		case .Rugby:
			return "Rugby"
		case .Running:
			return "Running"
		case .Sailing:
			return "Sailing"
		case .SkatingSports:
			return "Skating Sports"
		case .SnowSports:
			return "Snow Sports"
		case .Snowboarding:
			return "Snowboarding"
		case .Soccer:
			return "Soccer"
		case .Softball:
			return "Softball"
		case .Squash:
			return "Squash"
		case .StairStepper:
			return "Stair Stepper"
		case .Stairs:
			return "Stairs"
		case .StepTraining:
			return "Step Training"
		case .SurfingSports:
			return "Surfing Sports"
		case .Swimming:
			return "Swimming"
		case .TableTennis:
			return "Table Tennis"
		case .TaiChi:
			return "Tai Chi"
		case .Tennis:
			return "Tennis"
		case .TrackAndField:
			return "Track And Field"
		case .TraditionalStrengthTraining:
			return "Traditional Strength Training"
		case .Volleyball:
			return "Volleyball"
		case .Walking:
			return "Walking"
		case .WaterFitness:
			return "Water Fitness"
		case .WaterPolo:
			return "Water Polo"
		case .WaterSports:
			return "Water Sports"
		case .WheelchairRunPace:
			return "Wheelchair Run Pace"
		case .WheelchairWalkPace:
			return "Wheelchair Walk Pace"
		case .Wrestling:
			return "Wrestling"
		case .Yoga:
			return "Yoga"

        }
    }
}

extension Jelly_WFWorkoutReadableActivityType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
