//
//  Aggrandizement.swift
//  
//
//  Created by Taylor Lineman on 11/2/22.
//

enum Aggrandizement: Codable {
    case get(property: String)
    case `as`(typeCast: TypeCoercion)
    case key(key: String)
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case .get(let property):
            try container.encode(QuantumValue([
                "PropertyName": property,
                "Type": "WFPropertyVariableAggrandizement"
            ]))
        case .as(let typeCast):
            try container.encode(QuantumValue([
                "CoercionItemClass": typeCast.rawValue,
                "Type": "WFCoercionVariableAggrandizement"
            ]))
        case .key(let key):
            try container.encode(QuantumValue([
                "DictionaryKey": key,
                "Type": "WFDictionaryValueVariableAggrandizement"
            ]))
        }
    }
}

enum TypeCoercion: String, CaseIterable, Codable {
    case appstore = "WFAppStoreAppContentItem"
    case article = "WFArticleContentItem"
    case boolean = "WFBooleanContentItem"
    case contact = "WFContactContentItem"
    case date = "WFDateContentItem"
    case dictionary = "WFDictionaryContentItem"
    case email = "WFEmailAddressContentItem"
    case file = "WFGenericFileContentItem"
    case image = "WFImageContentItem"
    case imedia = "WFMPMediaContentItem"
    case iproduct = "WFiTunesProductContentItem"
    case location = "WFLocationContentItem"
    case maplink = "WFDCMapsLinkContentItem"
    case media = "WFAVAssetContentItem"
    case number = "WFNumberContentItem"
    case pdf = "WFPDFContentItem"
    case phonenumber = "WFPhoneNumberContentItem"
    case photo = "WFPhotoMediaContentItem"
    case place = "WFMKMapItemContentItem"
    case richText = "WFRichTextContentItem"
    case webpage = "WFSafariWebPageContentItem"
    case url = "WFURLContentItem"
    case vcard = "WFVCardContentItem"
    case string = "WFStringContentItem"
    
    init?(value: String) {
        switch value.lowercased() {
        case "appstore":
            self = .appstore
        case "article":
            self = .article
        case "boolean":
            self = .boolean
        case "contact":
            self = .contact
        case "date":
            self = .date
        case "dictionary":
            self = .dictionary
        case "email":
            self = .email
        case "file":
            self = .file
        case "image":
            self = .image
        case "imedia":
            self = .imedia
        case "iproduct":
            self = .iproduct
        case "location":
            self = .location
        case "maplink":
            self = .maplink
        case "media":
            self = .media
        case "number":
            self = .number
        case "pdf":
            self = .pdf
        case "phonenumber":
            self = .phonenumber
        case "photo":
            self = .photo
        case "place":
            self = .place
        case "richText":
            self = .richText
        case "webpage":
            self = .webpage
        case "url":
            self = .url
        case "vcard":
            self = .vcard
        case "string":
            self = .string
        case "text":
            self = .string
        default:
            return nil
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.rawValue)
    }
}
