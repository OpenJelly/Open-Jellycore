//
//  Jelly_WFCountry.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFCountry: String, JellyEnum, Codable {
	case AscensionIsland
	case Andorra
	case UnitedArabEmirates
	case Afghanistan
	case AntiguaBarbuda
	case Anguilla
	case Albania
	case Angola
	case Antartica
	case Argentina
	case AmericanSamoa
	case Austria
	case Australia
	case Aruba
	case ÅlandIslands
	case Azerbaijan
	case BosniaHerzegovina
	case Barbados
	case Bangladesh
	case Belgium
	case BurkinaFaso
	case Bulgaria
	case Bahrain
	case Burundi
	case Benin
	case StBarthélemy
	case Bermuda
	case Brunei
	case Bolivia
	case CaribbeanNetherlands
	case Brazil
	case Bahamas
	case Bhutan
	case BouvetIsland
	case Botswana
	case Belarus
	case Belize
	case Canada
	case CocosKeelingIslands
	case CongoKinshasa
	case CentralAfricanRepublic
	case CongoBrazzaville
	case Switzerland
	case CôtedIvoire
	case CookIslands
	case Chile
	case Cameroon
	case Chinamainland
	case Columbia
	case ClippertonIsland
	case CostaRica
	case Cuba
	case CapeVerde
	case Curaçao
	case ChristmasIsland
	case Cyprus
	case Czechia
	case Germany
	case DiegoGarcia
	case Djibouti
	case Denmark
	case Dominica
	case DominicanRepublic
	case Algeria
	case CeutaMelilla
	case Ecuador
	case Estonia
	case Egypt
	case WesterSahara
	case Eritrea
	case Spain
	case Ethiopia
	case Finland
	case Fiji
	case FalklandIslands
	case Micronesia
	case FaroeIslands
	case France
	case Gabon
	case UnitedKingdom
	case Grenada
	case Georgia
	case FrenchGuiana
	case Guernsey
	case Ghana
	case Gibraltar
	case Greenland
	case Gambia
	case Guinea
	case Guadeloupe
	case EquatorialGuinea
	case Greece
	case SoGeorgiaSoSandwichIsl
	case Guatemala
	case Guam
	case GuineaBissau
	case Guyana
	case HongKong
	case HeardMcDonaldIslands
	case Honduras
	case Croatia
	case Haiti
	case Hungary
	case CanaryIslands
	case Indonesia
	case Ireland
	case Israel
	case IsleofMan
	case India
	case BritishIndianOceanTerritory
	case Iraq
	case Iran
	case Iceland
	case Italy
	case Jersey
	case Jamaica
	case Jordan
	case Japan
	case Kenya
	case Kyrgyzstan
	case Cambodia
	case Kribati
	case Comoros
	case StKittsNevis
	case NorthKorea
	case SouthKorea
	case Kuwait
	case CaymanIslands
	case Kazakhstan
	case Laos
	case Lebanon
	case StLucia
	case Liechtenstein
	case SriLanka
	case Liberia
	case Lesotho
	case Lithuania
	case Luxembourg
	case Latvia
	case Libya
	case Morocco
	case Monaco
	case Moldova
	case Montenegro
	case StMartin
	case Madagascar
	case MarshallIslands
	case NorthMacedonia
	case Mali
	case MyanmarBurma
	case Mongolia
	case Macao
	case NorthernMarianaIslands
	case Martinique
	case Mauritania
	case Montserrat
	case Malta
	case Mauritius
	case Maldives
	case Malawi
	case Mexico
	case Malaysia
	case Mozambique
	case Namibia
	case NewCaledonia
	case Niger
	case NorfolkIsland
	case Nigeria
	case Netherlands
	case Norway
	case Nepal
	case Nauru
	case Niue
	case NewZealand
	case Oman
	case Panama
	case Peru
	case FrenchPolynesia
	case PapuaNewGuinea
	case Philippines
	case Pakistan
	case Poland
	case StPierreMiquelon
	case PitcairnIslands
	case PuertoRico
	case PalestinianTerritories
	case Portugal
	case Palau
	case Paraguay
	case Qatar
	case Réunion
	case Romania
	case Serbia
	case Russia
	case Rwanda
	case SaudiArabia
	case SolomonIslands
	case Seychelles
	case Sudan
	case Sweden
	case Singapore
	case StHelena
	case Slovenia
	case SvalbardJanMayen
	case Slovakia
	case SierraLeone
	case SanMarino
	case Senegal
	case Somalia
	case Suriname
	case SouthSudan
	case SãoToméPríncipe
	case ElSalvador
	case SintMaarten
	case Syria
	case Eswatini
	case TristandaCunha
	case TurksCaicosIslands
	case Chad
	case FrenchSouthernTerritories
	case Togo
	case Thailand
	case Tajikistan
	case Tokelau
	case TimorLeste
	case Turkmenistan
	case Tunisia
	case Tonga
	case Turkey
	case TrinidadTobago
	case Tuvalu
	case Taiwan
	case Tanzania
	case Ukraine
	case Uganda
	case USOutlyingIslands
	case UnitedStates
	case Uruguay
	case Uzbekistan
	case VaticanCity
	case StVincentGrenadines
	case Venezuela
	case BritishVirginIslands
	case USVirginIslands
	case Vietnam
	case Vanuatu
	case WallisFutuna
	case Samoa
	case Kosovo
	case Yemen
	case Mayotte
	case SouthAfrica
	case Zambia
	case Zimbabwe

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .AscensionIsland:
			return "Ascension Island"
		case .Andorra:
			return "Andorra"
		case .UnitedArabEmirates:
			return "United Arab Emirates"
		case .Afghanistan:
			return "Afghanistan"
		case .AntiguaBarbuda:
			return "Antigua & Barbuda"
		case .Anguilla:
			return "Anguilla"
		case .Albania:
			return "Albania"
		case .Angola:
			return "Angola"
		case .Antartica:
			return "Antartica"
		case .Argentina:
			return "Argentina"
		case .AmericanSamoa:
			return "American Samoa"
		case .Austria:
			return "Austria"
		case .Australia:
			return "Australia"
		case .Aruba:
			return "Aruba"
		case .ÅlandIslands:
			return "Åland Islands"
		case .Azerbaijan:
			return "Azerbaijan"
		case .BosniaHerzegovina:
			return "Bosnia & Herzegovina"
		case .Barbados:
			return "Barbados"
		case .Bangladesh:
			return "Bangladesh"
		case .Belgium:
			return "Belgium"
		case .BurkinaFaso:
			return "Burkina Faso"
		case .Bulgaria:
			return "Bulgaria"
		case .Bahrain:
			return "Bahrain"
		case .Burundi:
			return "Burundi"
		case .Benin:
			return "Benin"
		case .StBarthélemy:
			return "St. Barthélemy"
		case .Bermuda:
			return "Bermuda"
		case .Brunei:
			return "Brunei"
		case .Bolivia:
			return "Bolivia"
		case .CaribbeanNetherlands:
			return "Caribbean Netherlands"
		case .Brazil:
			return "Brazil"
		case .Bahamas:
			return "Bahamas"
		case .Bhutan:
			return "Bhutan"
		case .BouvetIsland:
			return "Bouvet Island"
		case .Botswana:
			return "Botswana"
		case .Belarus:
			return "Belarus"
		case .Belize:
			return "Belize"
		case .Canada:
			return "Canada"
		case .CocosKeelingIslands:
			return "Cocos (Keeling) Islands"
		case .CongoKinshasa:
			return "Congo - Kinshasa"
		case .CentralAfricanRepublic:
			return "Central African Republic"
		case .CongoBrazzaville:
			return "Congo - Brazzaville"
		case .Switzerland:
			return "Switzerland"
		case .CôtedIvoire:
			return "Côte d'Ivoire"
		case .CookIslands:
			return "Cook Islands"
		case .Chile:
			return "Chile"
		case .Cameroon:
			return "Cameroon"
		case .Chinamainland:
			return "China mainland"
		case .Columbia:
			return "Columbia"
		case .ClippertonIsland:
			return "Clipperton Island"
		case .CostaRica:
			return "Costa Rica"
		case .Cuba:
			return "Cuba"
		case .CapeVerde:
			return "Cape Verde"
		case .Curaçao:
			return "Curaçao"
		case .ChristmasIsland:
			return "Christmas Island"
		case .Cyprus:
			return "Cyprus"
		case .Czechia:
			return "Czechia"
		case .Germany:
			return "Germany"
		case .DiegoGarcia:
			return "Diego Garcia"
		case .Djibouti:
			return "Djibouti"
		case .Denmark:
			return "Denmark"
		case .Dominica:
			return "Dominica"
		case .DominicanRepublic:
			return "Dominican Republic"
		case .Algeria:
			return "Algeria"
		case .CeutaMelilla:
			return "Ceuta & Melilla"
		case .Ecuador:
			return "Ecuador"
		case .Estonia:
			return "Estonia"
		case .Egypt:
			return "Egypt"
		case .WesterSahara:
			return "Wester Sahara"
		case .Eritrea:
			return "Eritrea"
		case .Spain:
			return "Spain"
		case .Ethiopia:
			return "Ethiopia"
		case .Finland:
			return "Finland"
		case .Fiji:
			return "Fiji"
		case .FalklandIslands:
			return "Falkland Islands"
		case .Micronesia:
			return "Micronesia"
		case .FaroeIslands:
			return "Faroe Islands"
		case .France:
			return "France"
		case .Gabon:
			return "Gabon"
		case .UnitedKingdom:
			return "United Kingdom"
		case .Grenada:
			return "Grenada"
		case .Georgia:
			return "Georgia"
		case .FrenchGuiana:
			return "French Guiana"
		case .Guernsey:
			return "Guernsey"
		case .Ghana:
			return "Ghana"
		case .Gibraltar:
			return "Gibraltar"
		case .Greenland:
			return "Greenland"
		case .Gambia:
			return "Gambia"
		case .Guinea:
			return "Guinea"
		case .Guadeloupe:
			return "Guadeloupe"
		case .EquatorialGuinea:
			return "Equatorial Guinea"
		case .Greece:
			return "Greece"
		case .SoGeorgiaSoSandwichIsl:
			return "So. Georgia & So. Sandwich Isl."
		case .Guatemala:
			return "Guatemala"
		case .Guam:
			return "Guam"
		case .GuineaBissau:
			return "Guinea-Bissau"
		case .Guyana:
			return "Guyana"
		case .HongKong:
			return "Hong Kong"
		case .HeardMcDonaldIslands:
			return "Heard & McDonald Islands"
		case .Honduras:
			return "Honduras"
		case .Croatia:
			return "Croatia"
		case .Haiti:
			return "Haiti"
		case .Hungary:
			return "Hungary"
		case .CanaryIslands:
			return "Canary Islands"
		case .Indonesia:
			return "Indonesia"
		case .Ireland:
			return "Ireland"
		case .Israel:
			return "Israel"
		case .IsleofMan:
			return "Isle of Man"
		case .India:
			return "India"
		case .BritishIndianOceanTerritory:
			return "British Indian Ocean Territory"
		case .Iraq:
			return "Iraq"
		case .Iran:
			return "Iran"
		case .Iceland:
			return "Iceland"
		case .Italy:
			return "Italy"
		case .Jersey:
			return "Jersey"
		case .Jamaica:
			return "Jamaica"
		case .Jordan:
			return "Jordan"
		case .Japan:
			return "Japan"
		case .Kenya:
			return "Kenya"
		case .Kyrgyzstan:
			return "Kyrgyzstan"
		case .Cambodia:
			return "Cambodia"
		case .Kribati:
			return "Kribati"
		case .Comoros:
			return "Comoros"
		case .StKittsNevis:
			return "St. Kitts & Nevis"
		case .NorthKorea:
			return "North Korea"
		case .SouthKorea:
			return "South Korea"
		case .Kuwait:
			return "Kuwait"
		case .CaymanIslands:
			return "Cayman Islands"
		case .Kazakhstan:
			return "Kazakhstan"
		case .Laos:
			return "Laos"
		case .Lebanon:
			return "Lebanon"
		case .StLucia:
			return "St. Lucia"
		case .Liechtenstein:
			return "Liechtenstein"
		case .SriLanka:
			return "Sri Lanka"
		case .Liberia:
			return "Liberia"
		case .Lesotho:
			return "Lesotho"
		case .Lithuania:
			return "Lithuania"
		case .Luxembourg:
			return "Luxembourg"
		case .Latvia:
			return "Latvia"
		case .Libya:
			return "Libya"
		case .Morocco:
			return "Morocco"
		case .Monaco:
			return "Monaco"
		case .Moldova:
			return "Moldova"
		case .Montenegro:
			return "Montenegro"
		case .StMartin:
			return "St. Martin"
		case .Madagascar:
			return "Madagascar"
		case .MarshallIslands:
			return "Marshall Islands"
		case .NorthMacedonia:
			return "North Macedonia"
		case .Mali:
			return "Mali"
		case .MyanmarBurma:
			return "Myanmar (Burma)"
		case .Mongolia:
			return "Mongolia"
		case .Macao:
			return "Macao"
		case .NorthernMarianaIslands:
			return "Northern Mariana Islands"
		case .Martinique:
			return "Martinique"
		case .Mauritania:
			return "Mauritania"
		case .Montserrat:
			return "Montserrat"
		case .Malta:
			return "Malta"
		case .Mauritius:
			return "Mauritius"
		case .Maldives:
			return "Maldives"
		case .Malawi:
			return "Malawi"
		case .Mexico:
			return "Mexico"
		case .Malaysia:
			return "Malaysia"
		case .Mozambique:
			return "Mozambique"
		case .Namibia:
			return "Namibia"
		case .NewCaledonia:
			return "New Caledonia"
		case .Niger:
			return "Niger"
		case .NorfolkIsland:
			return "Norfolk Island"
		case .Nigeria:
			return "Nigeria"
		case .Netherlands:
			return "Netherlands"
		case .Norway:
			return "Norway"
		case .Nepal:
			return "Nepal"
		case .Nauru:
			return "Nauru"
		case .Niue:
			return "Niue"
		case .NewZealand:
			return "New Zealand"
		case .Oman:
			return "Oman"
		case .Panama:
			return "Panama"
		case .Peru:
			return "Peru"
		case .FrenchPolynesia:
			return "French Polynesia"
		case .PapuaNewGuinea:
			return "Papua New Guinea"
		case .Philippines:
			return "Philippines"
		case .Pakistan:
			return "Pakistan"
		case .Poland:
			return "Poland"
		case .StPierreMiquelon:
			return "St. Pierre & Miquelon"
		case .PitcairnIslands:
			return "Pitcairn Islands"
		case .PuertoRico:
			return "Puerto Rico"
		case .PalestinianTerritories:
			return "Palestinian Territories"
		case .Portugal:
			return "Portugal"
		case .Palau:
			return "Palau"
		case .Paraguay:
			return "Paraguay"
		case .Qatar:
			return "Qatar"
		case .Réunion:
			return "Réunion"
		case .Romania:
			return "Romania"
		case .Serbia:
			return "Serbia"
		case .Russia:
			return "Russia"
		case .Rwanda:
			return "Rwanda"
		case .SaudiArabia:
			return "Saudi Arabia"
		case .SolomonIslands:
			return "Solomon Islands"
		case .Seychelles:
			return "Seychelles"
		case .Sudan:
			return "Sudan"
		case .Sweden:
			return "Sweden"
		case .Singapore:
			return "Singapore"
		case .StHelena:
			return "St. Helena"
		case .Slovenia:
			return "Slovenia"
		case .SvalbardJanMayen:
			return "Svalbard & Jan Mayen"
		case .Slovakia:
			return "Slovakia"
		case .SierraLeone:
			return "Sierra Leone"
		case .SanMarino:
			return "San Marino"
		case .Senegal:
			return "Senegal"
		case .Somalia:
			return "Somalia"
		case .Suriname:
			return "Suriname"
		case .SouthSudan:
			return "South Sudan"
		case .SãoToméPríncipe:
			return "São Tomé & Príncipe"
		case .ElSalvador:
			return "El Salvador"
		case .SintMaarten:
			return "Sint Maarten"
		case .Syria:
			return "Syria"
		case .Eswatini:
			return "Eswatini"
		case .TristandaCunha:
			return "Tristan da Cunha"
		case .TurksCaicosIslands:
			return "Turks & Caicos Islands"
		case .Chad:
			return "Chad"
		case .FrenchSouthernTerritories:
			return "French Southern Territories"
		case .Togo:
			return "Togo"
		case .Thailand:
			return "Thailand"
		case .Tajikistan:
			return "Tajikistan"
		case .Tokelau:
			return "Tokelau"
		case .TimorLeste:
			return "Timor-Leste"
		case .Turkmenistan:
			return "Turkmenistan"
		case .Tunisia:
			return "Tunisia"
		case .Tonga:
			return "Tonga"
		case .Turkey:
			return "Turkey"
		case .TrinidadTobago:
			return "Trinidad & Tobago"
		case .Tuvalu:
			return "Tuvalu"
		case .Taiwan:
			return "Taiwan"
		case .Tanzania:
			return "Tanzania"
		case .Ukraine:
			return "Ukraine"
		case .Uganda:
			return "Uganda"
		case .USOutlyingIslands:
			return "U.S. Outlying Islands"
		case .UnitedStates:
			return "United States"
		case .Uruguay:
			return "Uruguay"
		case .Uzbekistan:
			return "Uzbekistan"
		case .VaticanCity:
			return "Vatican City"
		case .StVincentGrenadines:
			return "St. Vincent & Grenadines"
		case .Venezuela:
			return "Venezuela"
		case .BritishVirginIslands:
			return "British Virgin Islands"
		case .USVirginIslands:
			return "U.S. Virgin Islands"
		case .Vietnam:
			return "Vietnam"
		case .Vanuatu:
			return "Vanuatu"
		case .WallisFutuna:
			return "Wallis & Futuna"
		case .Samoa:
			return "Samoa"
		case .Kosovo:
			return "Kosovo"
		case .Yemen:
			return "Yemen"
		case .Mayotte:
			return "Mayotte"
		case .SouthAfrica:
			return "South Africa"
		case .Zambia:
			return "Zambia"
		case .Zimbabwe:
			return "Zimbabwe"

        }
    }
}

extension Jelly_WFCountry {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
